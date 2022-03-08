Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B95C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 16:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXdcl4hQr35iT8Dz/GyhDYXFyvWxlb79I5nAV7ErYO8=; b=3DaVm4qLuTlpno
	k72TW1xNp7EM92141znTN8KvM94aSWAr5XTpX9aAcACXcu6GJ0ChnEFJ3FIEvIV7IFUJ2mUxZm6zf
	eC7fULwEbnNgRXc20HbGJ3MXB0v2lvfxK9UNWvvy6BRoi3KESMSo5zRKvbqm0E4ghndACvz7X+eFu
	oF1W1CoNkKztri/mN1XtTz5hfBGwaGh6NbOJPbCcoa0s04EVgT1H33xmuNdXWCzdu47LGFFrHzoqc
	y+oJXbryR1bsH4nm7pahbXEXNZKu8P4Lmt1BNJDTPAU+GUv9haCiMet4z2VX02KdQUyMxLhCEKBa0
	HUTWTFk7w3cQxSPtGX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRd58-005L7T-Bu; Tue, 08 Mar 2022 16:53:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRcxk-005IgW-KR; Tue, 08 Mar 2022 16:45:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38404B81B64;
 Tue,  8 Mar 2022 16:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA1AC340F5;
 Tue,  8 Mar 2022 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646757925;
 bh=BvuACGeXbeP1bLbpyNZb+43YQ7D2IBjf9sCvlyz6B9g=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DizfbVMiQGUk8dJHciQJ4RyZ3FzRvB63Rfaud7p1A8Oh05x8dTvbxtu3YFNU88ejE
 HRXGsI9K6v5XK1I7OONAla/gbV8k5YeBb5XVJ81//eg3f+AxdNrzUVof08ZTgN0EH1
 GpK1hBQK3MsGIUEB5z6h+DNCDnnIdc+gQsORmmiPSDpGocsp27biubRXK8GSJtNsCe
 9l2uats+dPQn9i8L3VQ2n8kjd4U+7Hf5h0ZnnysR1kmbo36ShMNXtS2o7oKy28McxU
 AUuVVyGrAwpxWU5L12Y3CKEOamzNHDWpbbE7mEgq3DmXiseBflj+JpA2xjsAGgbzog
 HLglP4iZ2zUPg==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: dts: mediatek updates on dts32 for v5.18
Date: Tue,  8 Mar 2022 17:44:42 +0100
Message-Id: <164675781062.4163171.16962087279129392112.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3974dc7e-4185-4d88-ab5b-031a7d24214d@gmail.com>
References: <3974dc7e-4185-4d88-ab5b-031a7d24214d@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_084528_863196_47569FA3 
X-CRM114-Status: GOOD (  14.27  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:49:10 +0100, Matthias Brugger wrote:
> Please find below the updates for the 32 bit based SoC from Mediatek.
> We got very initial support for mt6582 and a tablet based on the SoC. Hopefully
> we will get more support for the components of this rather old SoC.
> On the other hand we get some support for the Airoha EN7523. Unfortunately I
> didn't got any response for the clock and PCIe driver, so I decided to not wait
> any longer and go forward to add the parts that are ready. We'll have to work
> with the maintainer to unblock the situation on the two left drivers.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8a6ea4edcf3e1c9eada53d64da192df009fddc18

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
