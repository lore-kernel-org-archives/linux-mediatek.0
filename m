Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054F1CD4F49
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hZ0DmXtfO0mVOWI8ztal4x0YWCO2JbP+iHvsMVoOXQ=; b=a5JAKM/3ejpBQ292WrTn3eKTTd
	IHCkkoFlwarQjVk8peQGPeKt1PWvVWc70vhmLXXNapx3rPNin6wVBFKowukNtH70AEc36YkSbd6l6
	Q25DtI7lsZi7DlOzyS5YGeCsJDRm1Vl2PjPOU+sdCnAku0ADgLykMSQ9K1NCq5VBFg+SXzo8A2LR7
	xC75a7kP02IQ0KsaoqVDa+VIDXxDKZdcQ+r6f/+luqB4dH1eKhczIhmUm7S7xDzx7DhltHYN5Yryq
	/l3DrYAU6HsmHpNVBgPid2n4ZBucYRVcKGTQ7p9zA04/hGnfXFtWpDMLM+27vScWsLsd2YSZICKZL
	IMsdGFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0uH-0000000GJMh-3GEa;
	Mon, 18 May 2026 16:33:29 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0uD-0000000GJK6-12iI
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 16:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1779121992; x=1779726792; i=aros@gmx.com;
	bh=2hZ0DmXtfO0mVOWI8ztal4x0YWCO2JbP+iHvsMVoOXQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CDYvKmeIVsVdeokYBrdrVzzoOskgI3pwl4cS7qLnxgu82LTLsdpA/1g0/nXod3aC
	 47uoDy5F5RuJfDCmKmPHxKM0bW15Tft34nlbnWxHGa4NCJgezUtMDM2C3abaWI33Y
	 86AciJHC8lwaMBZsSB+ibrSPP2FllaVyeJfzDXoGFiMJW7d34f/XK81J1t0YClQhX
	 oAeSwAWdd2mz4nTIihhkmt1ltuYJiyyL4mdo8GJ+0FXkK7S8um1okmT6ifYgftqLh
	 SrDPi1FGfbRtbIyTruHNBhUV1ndd/C4nzYGBlGm/f1JgfJItwXbegjiZwrbaszQTJ
	 djeV+HNxOyR+6w+VZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MFKKX-1wZg1k3JGb-008KqY; Mon, 18
 May 2026 18:33:12 +0200
Message-ID: <79571779-316d-4d7b-bbca-554328ec7dd6@gmx.com>
Date: Mon, 18 May 2026 20:33:02 +0400
MIME-Version: 1.0
To: pav@iki.fi
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mark-yw.chen@mediatek.com
References: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
Subject: Re: [PATCH] Bluetooth: btmtk: accept too short WMT FUNC_CTRL events
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QJeaSCqt6AqFQFG3VgCx+8exFRIfsR1vocENO6Bdegcgveo2Pzf
 Rkauv7a5OZoDJhbgk1MaDHOwvhJ/DUMiJR39QJmy7W5II+jspLhTPw6RPjbUn+o1tslETn/
 P7os9HrPuo8urLCOludGncrUxLcZEGjzWvJAONT9Gp6FK66Wc0rrY5Wusm0rh5kOcHWvd+U
 1/8syUvgq5T+kr0RlRM6w==
UI-OutboundReport: notjunk:1;M01:P0:FMA9K/Yar4c=;OvqCvhdop17eBGHOoD/JlKbpyQA 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093325_645025_37B5F97D 
X-CRM114-Status: UNSURE (   5.22  )
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

Hello,

The kernel bug tracker already has half a dozen bug reports in regard to=
=20
this regression, yet almost a week later I still don't see the fix=20
pushed to stable.

Please do.

Regards,
Artem

