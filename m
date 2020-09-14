Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EB4C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 11:48:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A11921741
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 11:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4UpC4qH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="fru1DzCl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A11921741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pHQVM/IeWiPLtxDLp0F691sAk7RMjE7GxAIiFcd8+iY=; b=p4UpC4qH08Pd01Zfeo9XMvwbi
	zVX5nln1sPuRZWChvQfirSaP0tEqGZPv6UOR6jDloETjIXOitMpy8djpACKy3Yzl8JP+QtRAghiGW
	+ZKG0DADcRuIqh+6din0jmZGN0vJ4ofrzgMlBuMl2Z63u+MNVE8Sh54SPciG1Qf4r9kwdfcUBUs6j
	bI/hapuFOldwX5KTl9B1smKkwHhwVCjRtpAdlU0GAkPG2ozNM5J3qV0xmcewAvfnhWGUY1edjfgqO
	CIRTjMyQ8m8Yg9zHEtlr3q3jzXGRMYGxmHdMjAH7nu6EEsmayiXuOMOMNwa7nre3JUQhiuWvRn0v5
	QxuUwz/DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHmxx-0007Fz-62; Mon, 14 Sep 2020 11:48:13 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHmxs-0007FQ-Oa; Mon, 14 Sep 2020 11:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1600084081;
 bh=f0dZy9+FhBEO7GSEaqvJXC6YpjJ355zoFG9pqHjP6XQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fru1DzCl2lF9mNwSVQ2/IVOB1jb+TCsxJitCL3zcvGU2KKVyXvwg3DW3V76YL9aa/
 ScekZFEhnBj/ZpL7XQo8UQhFpHGRWmNlu21D8IFs4BB8ey7VdbO239aQOyllecEFoN
 LdvoeOP619qgLCF55ZaVfCF+vuQW9olfaEvLhgX0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.101] ([80.208.209.101]) by web-mail.gmx.net
 (3c-app-gmx-bap20.server.lan [172.19.172.90]) (via HTTP); Mon, 14 Sep 2020
 13:39:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-a791b919-956f-4cde-a496-919d4f3f2ba9-1600083556775@3c-app-gmx-bap20>
From: Frank Wunderlich <frank-w@public-files.de>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Aw: [PATCH v6 0/4] Spilt PCIe node to comply with hardware design
Date: Mon, 14 Sep 2020 13:39:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200914112659.7091-1-chuanjia.liu@mediatek.com>
References: <20200914112659.7091-1-chuanjia.liu@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:0PDB+aZRuNST62kZwEGOyCa7pLdlcYqnwgLUj7ZrKDks0V8Xio4QC3Ubo+Np/Ci+Ityxp
 h4alMQQsNmo4MFcxcJp8R6rh4h0FY1YPTSk0QPidhgQxb2/iyNahEr1dz/wrSg6uCXyefnyUCQju
 TYlsfLu/ioVfRJ+7GnN2a8CtWXAnwTvWd+viD1itLrq+ju6/mVtKkHFtjHZnPpig8AqEyKYFAABb
 8Xr3KxXPX5WteQV82FDNbcYn3VcjiNqA7Nes5HC/Bh/h4VCI/cgsQvt8JWWJf7iMtjzVkr6WWKVJ
 cw=
X-UI-Out-Filterresults: notjunk:1;V03:K0:vW/1DV7PNnY=:gykiQr3j0hc9xuvF6g/C0K
 IotVbDjjyYsJF4VFRS1e6deGSnNCC/9vM6Ym9ze0ISEzLyp2BtPvz6QmsytzI+U0qAvuUjvxe
 ItBpgTz2b7qYy1TFY0MqiL5JAPyYBLaL2cyC9y/92tFQv0gDcN7e+RKTKsa1rIJgr2ydw9X5n
 CQ52uWodkDfMbCs5UL5g33mb7ndOpVkUmFvCoUskCi3XGZ6fFW3+LMnJLo6NSgSefmuu7/Nx+
 JDHLU1AM2H6WY5KBgg+/dEW5DWaEkxsZImeV87DeABut8/ugIA0oY4lhRVITceI7PdpNzyOS2
 Mp6OEercOePRedj7uGZDkZWtiSoTjDOxa7vLH/rbFkJX+rSbjlfuEN8uJrR93TnjaEvr1pHqx
 9DFbbCtyFvcuP7sf9t1iHDAhjCykwH/klY8yZMsvgfwwdi2QeifyVEVOS5btvzMEynWkFaVgU
 8jnC21bsbupJJMRM+/LvpTXN47nUi195zvdq1pHPBpdD8pmeNV/Oyo2KIqYX0RSiQx01hMRyG
 h8jGHwCQH6qBmwYzv5zNzEY79nhpwISmCIZb480SKnP2HTFYq/XZ6OGNNlevUlhnBqici0GGo
 3grUQ7RtAlwTUxF2kT3Yvv08aOHhFIqFPF1LmF0P/4smCJnGjsZQUgGXPelwNhVwMjUB1add7
 BBNNfH0ebNWzqtS1PV59vLzzNhHUz5lm3UflYfbfmp9zapsmC2/+9DYjCWlr8NkWQg4U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_074809_091869_44AB3FF2 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-pci@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Betreff: [PATCH v6 0/4] Spilt PCIe node to comply with hardware design

just if you need to make another version (as it is only the cover-letter) you can fix the typo in subject ;)

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
