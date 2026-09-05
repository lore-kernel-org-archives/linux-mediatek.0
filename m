Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8535C624DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2026 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SkyVKSH31057q08Z6yPO6FAD7RhHFBkie3SGBwL48U=; b=YA41OGBYujYnoTpeZpj0tdjcqp
	yrF+9U0asqrJUa0pQWvmc0YKznZhY3WE4huW037QnhuihOlWOPDxifoK3W7f3JM9oIS1NEGQg0uYF
	HbL8hupNg/V8vO1f1g6Hby5wNBBgFjvaYOHPdHA3+3YvKja2Nda+QfvW0enz9hJ9SsC8idAAGY3NC
	Jq/swENlQKviZYn36N32a+8n0nWYpQSIf/icjFmPWOk8k5h/jDU6WvJY+BSclp7Twv4KM7JPECEB+
	nopaJwynZYr6MrsojEE8PH6pi9psxTVjAeGYwMgkt/7xySh4vdZoOMFYA5V7D/lvkMLQL2Luap/0R
	V+snv5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kyO-00000003o9f-1xQ0;
	Sat, 05 Sep 2026 07:38:00 +0000
Received: from out-60.mta0.migadu.com ([2001:41d0:1004:224b::3c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kyL-00000003o9D-0YGz
	for linux-mediatek@lists.infradead.org;
	Sat, 05 Sep 2026 07:37:59 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0SkyVKSH31057q08Z6yPO6FAD7RhHFBkie3SGBwL48U=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788593875; v=1; x=1789198675;
 b=eFRdxRWzkEzIVp0U3zC1yN2VsDXtkCiPVyUWsMEw0F09MyB9rbPrAJbaZFh+Q5EKloJw98CJ
 fK+93SwIqW1OSZNd3qr++W/V5DGygA1ZwxbiAZQIT6/J8i3EHQ4n1uetuF9tDI4WdcK3F0bgwqJ
 /vC0ZwAFNm7lqRr33/7Kgfkxj6HYsix/8cDKtA2Vpsv0yls6kB4H1m1//jeofpXKTTIRH8NDfWb
 QzDWXP8d7AmgZKgslzlCbJ4AAtaY7vw/F+JmyJc6tXHC26M6l19mwM9dC04GUs+IFybc4QUbRpd
 doFapFco0UZmrPf0KkIGNQWz/I/UxsVfIrlDXVNkdPffw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3b9b8b6c6d283ace;
	Sat, 05 Sep 2026 07:37:54 +0000
X-Mizu-Trace-ID: 3b9b8b6c6d283ace
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Sagun Kayastha <sgn.kayastha@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless v2] wifi: mt76: mt792x: pick the SAR table layout from the table itself
Date: Sat,  5 Sep 2026 00:37:51 -0700
Message-ID: <20260905073751.32850-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905013551.24635-1-lucid_duck@justthetip.ca>
References: <20260905013551.24635-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_003757_681180_D646CBA0 
X-CRM114-Status: UNSURE (   4.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sagun tested v2 on the GA503RM, the machine these tables came from. Both parse
as v2 and the FCC row reads. Transmit power goes from a flat 2 dBm to the 14.5
the table holds. His numbers are on the issue:

https://github.com/morrownr/mt76/issues/62#issuecomment-5550016870

He also notes the 5 GHz CCK row rising, 36 to 56 against an EEPROM 32. It reads
36 here with and without the patch, so the excess is not new. CCK is not sent on
5 GHz and 2.4 GHz is unaffected.

Tested-by: Sagun Kayastha <sgn.kayastha@gmail.com>

Devin

