Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1534FC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:10:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE6F260F59
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 18:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE6F260F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Mu24TZ+ROnYhU2XnRVHaS9ep2JX+Ie4twZq8Yxy1Yo=; b=hW0/l1e0yeKHC0
	athxF0twvfuX7VIMPpZsgvPvjVTNnK2wRWBhAZBT+/9ngU+3eMmXHQux1/MY9NePk+/sv84ICW7k4
	aqtf/FNZwbHmn8mV45nbv4lJAbdTCKazNK7IhlmxHN0ndCEqvGcHx1eScjDsCss45smhTIODmi6ii
	dt3mdoLzRhtYhOm+pbgGIFNayNquaU2TFgQ+YVVClXlQmH+ehWxipTtjK4mX+LEaSWDKkf76K/H4W
	Mq812jSbvO9xgHi8xftkPfcMeKNZppjSa2Si3+PN4XplrgBAuDV6YGaVfGnFptBESKyKLSpUqmQo/
	nOAUKV0AcSwAtqehmsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8RWh-00Fjxp-N2; Tue, 27 Jul 2021 18:09:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8RKR-00FeBJ-Kv; Tue, 27 Jul 2021 17:57:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34B5960F4F;
 Tue, 27 Jul 2021 17:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627408639;
 bh=a9AtedpsVUAuKM+1BFYeJHoM9kXALSnQx6b95mRzxr0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=crtnuMuVQtXJT+Dqi9SEAFT0Qqd2xh+phX/7i6EBctBM+InMqfTed18hsjWBFoYIk
 C+z+DvsgUJtVcdMhZYNEuXGzkS7mSvhRGcwy8gmLLCw5LPXyjrg7vK5KChezBxyUHt
 tZpDa3vMrUYd/Wyl09Vax8ZqVjGQayZRczoMJfL9As0tkICVsluu0+KJGaluCR0Vkf
 mWUjtEJt+ttHoTUd6NaDbIErl6cnAQ8js/mXvSWUBef9+IDT2Jd5gRwf2QljbCDd7l
 5ewaMVjFeJ1veb1hbtlw1011SuL6k1dzBs2gG2VamVhZwq2bEm/idtM9I5wObyFdVL
 gOevpWNZVwmcQ==
MIME-Version: 1.0
In-Reply-To: <20210726105719.15793-19-chun-jie.chen@mediatek.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-19-chun-jie.chen@mediatek.com>
Subject: Re: [v14 18/21] clk: mediatek: Add MT8192 msdc clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Jul 2021 10:57:17 -0700
Message-ID: <162740863716.2368309.17172525283851255354@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_105719_738581_F6C1E376 
X-CRM114-Status: UNSURE (   5.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chun-Jie Chen (2021-07-26 03:57:16)
> Add MT8192 msdc and msdc top clock providers
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
