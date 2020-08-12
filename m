Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70860C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 10:24:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1AE2076B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 10:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlojwTJP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YLDfA8o6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Nckk8k1Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1AE2076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bB4K83v6VY4HtqCS7MGmP7vw5yOsEStKQTD9wVgPX/I=; b=nlojwTJPok4FiwnlUslchOAvk
	ung/kxTkyW2oVUUsE1VJ0raefLbtpl/J1Qd0/YdP7fWa60pSeJ/I6Gc95ezlZdDY736YjFWsGqZRG
	eWfIL+oNhYW2Yn/jfeB+CU37EY4a2D8ma07K7jP03rqb9enDC7dtu7JkwFbDUSVq6+gPKh8AhWNG2
	eURPqUaFzulKuch++qXhv/eTQsFDjVz39oOg8PAyQW2vC5PQIiIgOJUGEYCRni5yz5H00ZOcyUuOS
	j3Ux9MUw1+Jx6D/l1gS+PDkmCWu5cGnDIQJKPP2WaA8uvND0ehwYUGKIxnqg94xHHFMhE8dv9NPOh
	oXzh/oX5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5nva-0005LA-Ku; Wed, 12 Aug 2020 10:24:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5nvZ-0005Kq-Q3
 for linux-mediatek@merlin.infradead.org; Wed, 12 Aug 2020 10:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=QzmvD7E2JOW+ZvlDDwzD+waAIR0ojqcPIHMtb1fz8A0=; b=YLDfA8o6seIv50bcBdZx0EVP6+
 13SvdNc/qhiB3rNvlGAni+qHEekEP4kyWibecOXTL6kal9kEmSO5Bu78WQ0NDJZMQXRRBq6GpmbpL
 EgKTYKS0QCkhkcioz9aLhClgvHvuRfD5Y4szRz87NWDjJvLrIrM+qVEHYtf7uc0UgfmF17v22NUUL
 aovs9N7YkzDWKSTC5d2uN6lmd9w6PBO/Wm6Cu9lyldnpa+HuY/fu9mWQ8oWRGLczMKgssjFgJXKuH
 mLqSm1/fwFauMCoGZCC2+WUEDLW5Y7acf3Xebwb/tU34KXYFOCyZee2lHnznvQX/jsigHbaBBNDid
 mVrh/Btg==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5nvB-0007g6-7z
 for linux-mediatek@lists.infradead.org; Wed, 12 Aug 2020 10:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597227707;
 bh=UkqjCxKKHV1HDyi41mZtq9yMhrKx967IftYVnHuBMGo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Nckk8k1Q6vh8KtK5Cmt8kW7J97N3M4LFitL78b6O2JQ0TML/LjY4u46nos8GfPc2F
 ftMrFQ+xH6Kw/2VjMIlVmmXLcqKVafGMdD1IvxQZn0s7j/i5jWw04Axz++D5g1r7d7
 VgO4nrKayRacTeHhDavTimviB0ZultlTnCS9Kldg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.41.139] ([185.53.41.139]) by web-mail.gmx.net
 (3c-app-gmx-bap56.server.lan [172.19.172.126]) (via HTTP); Wed, 12 Aug 2020
 12:07:58 +0200
MIME-Version: 1.0
Message-ID: <trinity-5b810acf-eb8f-452e-b08a-30e1fe46226d-1597226878715@3c-app-gmx-bap56>
From: Frank Wunderlich <frank-w@public-files.de>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Aw: [PATCH 3/3] mmc: mediatek: add optional module reset property
Date: Wed, 12 Aug 2020 12:07:58 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200812093726.10123-4-wenbin.mei@mediatek.com>
References: <20200812093726.10123-1-wenbin.mei@mediatek.com>
 <20200812093726.10123-4-wenbin.mei@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:t+v+dbXvTKFePvkpJQAkYHe5HoNVIemuMfLD56cl7pscYB573WfuroyNnOcU3eKU+Ux0w
 Bzr/Ckkf3ghFKTc0HwsL4hjb7JZpcAuLKIGlYRTDdvf/jlTHtulh0AIxWzbgZD0o/QUDiCzNjkkT
 sO5kefkm7G1UW6cNByINedYydy1x5x1KSNZ4caJ/jgdEUkwBF3dN/4r2t4BJSmLaKk6FpWb6i+m/
 LIO56ZvPG/DHOzaEApF96sk+MKAwEB1GS2joHA8xJDYDQNhmgLVskiKFp++wXff8gvYfNKazeZL8
 Bo=
X-UI-Out-Filterresults: notjunk:1;V03:K0:v3x8Q7TlnrY=:n9TdSe15WSj6qWbv6tU4Qh
 vGsvA1Ky1BNyAnhrV1zvW8QarDSc3o68KFTNJs3sfRtM26KIHvRKQrnZLFIWYif4qoJedrtpA
 55juGK0RnzgyTK44YFKsSY9iq4D2h2ZvM7GbDUxevNhcB68+F2pJa2XfOMj6vaqu+9m31Agmz
 2+Xez24RL3r67Z7bOs1t+qY1v0V67HUbRk5TBKgwLycaXFEameuIbVfEL+QBK+wspByMXWe8V
 7YJy/9msnl0TlZ/cEFoq2s/svAI1VXi9D+Uod9jwQmo0M+MYYklXKy69XG4s72I1pwROfw+I+
 FcJN3bOQnfnorg0lsDfDydm+nVCo5y1dzv63uDnL/si1tG4hnz24u2hPrCJGeI88YEdv+U+7E
 7Az0AWTQ2W7Dfyqjhk7jL3ZC5a1x3NrTpm670jark/ASGOSzYl/jzLEtEx21/zSAjXk4qonxj
 3lFaCy1GrWhDQuRfX/dd1bVzF1ENt8CxNB2aM7h949q9UeoYUEIJQunlm15ssgJhOWpcl5VWM
 ydR4bPuZUp/IqlcTAfcnHbrc2HgTqHSfx+Roe8sb2c6vSfAKSNUy8TlpY7r0cDQ+SwQb+oGjS
 +I97QkjjSDQRVfsLH4TieEwgTroWdjRSeLjoBWKArlci8QshLt0iqoV4SWVdgwAuyNPaJpA4o
 yCN+hoqkcTcHkSgQitni4RgUGa1tcBA2fvHWfZx6Flad4YkZNnaEyJ5eKAG3LhcdKGC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_112353_515896_A9FDCF90 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Mittwoch, 12. August 2020 um 11:37 Uhr
> Von: "Wenbin Mei" <wenbin.mei@mediatek.com>
> Betreff: [PATCH 3/3] mmc: mediatek: add optional module reset property

> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
>
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>

Thanks for posting the fix to Mainline

imho this should contain a fixes-Tag as it fixes eMMC-Access on mt7622/Bpi-R64

before we got these Errors on mounting eMMC ion R64:

[   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write

Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
Tested-By: Frank Wunderlich <frank-w@public-files.de>

and it needs to be fixed at least for 5.4+, so adding stable-CC

Cc: stable@vger.kernel.org

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
