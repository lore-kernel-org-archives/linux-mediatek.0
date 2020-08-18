Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D80C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BAC720738
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXjoHHDL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZjRXvCFW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="i6WRLedk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BAC720738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M4i4WJ/xnWPp+I22xM5bbRgkjciFILeNTu6vJo32WEI=; b=JXjoHHDLiYXNex7LIQNm2GXhd
	wbk/c0fyp84UvQ8qRKWNpzwbbhvN7c5+NXkVShH0u+FDGo5LcUA7+psyH9kBXHuFPcI/s9XjWnV5U
	jczIAsJEZzF0h9uMhEFLv3zsvxdYxNbdBUsOFDRHbalvOr2sLknoTIhEcNs1GEJHStFAexGTIu1Mn
	PsHLwMyajRqdc7oUB4ix/TtnyAJP25AsD3t6IQC8DbhNcB+0X+VfdZ2el9Wi2dfx3cK/g+el9z+Cg
	LyXNHqQcBMIrOhgxVESw8FjUIIH2QowmxTcPil/wSnMOncfA+QWcwx8u4vebQa9+MjzRqVUWnhq66
	78UTQ0lgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7wJI-00078P-7J; Tue, 18 Aug 2020 07:45:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wJG-00077y-TM
 for linux-mediatek@merlin.infradead.org; Tue, 18 Aug 2020 07:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ap693LLFeqKCPEJc56ThJpeeYc97CmzfomkRjHhl5Lc=; b=ZjRXvCFWPR4KYKW22bMgcNn9PF
 4U9ZqhArpStAsIFw/6hX+DGjOU34cNUTtWLPf7hoHYHOEAx7Gr33v0ScLyStaCEWmUnt2qnw3WIZ/
 JeLv03+v+LgST7/1NltZD6a/maWwaUb2a9gItykSYvVlOQyUu0oLG/SHjZbIkFMKgfXGztu3UH8un
 /aiDlhP+8vdmH2IP5EBqJu6nTbmtrG4sXy71F3A10qN5DxDalroMkURe8czbdsMwzaaMJt1Tm20xP
 2ukszMlRK3vB1Y957/gCNpA8c/l/2BEx7dap8XLT6lamF2hGgNxNYujZmcwxPF3rSIgiva5v9lRSI
 Ouyr7QEg==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wJC-0007oc-L8; Tue, 18 Aug 2020 07:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597736703;
 bh=ap693LLFeqKCPEJc56ThJpeeYc97CmzfomkRjHhl5Lc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=i6WRLedkh61h9EWnwL8+agH/ZhPLFobT8LQwX97RutWb02W8g51ojjqea5SoSJgRp
 pSQiyHg4h+JQz5eDzRZs1LxBH/TqxomEq3UsfPl502I8Lh6YYHHTrIMneUNuc4cb8e
 5CDlAxNeLU+UJvNobxpV58kb6BG/AZiC1d5daxlg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.43.192] ([185.53.43.192]) by web-mail.gmx.net
 (3c-app-gmx-bap75.server.lan [172.19.172.175]) (via HTTP); Tue, 18 Aug 2020
 09:45:03 +0200
MIME-Version: 1.0
Message-ID: <trinity-8b2a2966-9e61-4617-9cdc-fa496cfdd1af-1597736703797@3c-app-gmx-bap75>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related
 nodes to mt7623n.dtsi
Date: Tue, 18 Aug 2020 09:45:03 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <5EB39D93-57C0-47AD-B0F3-09AEE643CFBF@infradead.org>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
 <trinity-bbc9a618-a916-40bb-b144-bffe715646a4-1597734987449@3c-app-gmx-bap75>
 <5EB39D93-57C0-47AD-B0F3-09AEE643CFBF@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:85BOu6BZdj2Wig1BiNK0aOOhPHhkbzUQavsJfIXv/VN9miFbvhQHTt6im8lCBMQ+0oeEh
 ulmrdb/qo9PZvIVceuhKSdzs1AwzuG3BlQu1U7nIKN8i83ItITsAAddk7nlIBOH3yzpz5+513U/i
 SNIY2EIoMsHRr0Ie7x0Y4AwbaqlOwtk26v8oAm463L+J4RSdi57ZXMdd8qlGrUeRx1p3yBeUaTJf
 BwmKDZbBDGdxpUrHoCgn8BohE0r2ZKbEJ8/M3M5a25LQVVOEK2lTGVNnJXBmK+7Jjlb1ts7L5hjx
 jA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:s0ZG40dufYo=:hcHuqQMJtbMsOT9VqYBWd1
 5p/sXKqEySlXE7TBgaELLBeCDvBjzNy77c0v6XFV8OKM2TKRv+vxm8n8FxDkg02DJLze2XBt3
 cVJk3BKRNUWpFhvPOsv6nYjHqh+vzFEnDyhoDEvnuefRBNMoUsbwj0FB66OTnrPAxHlzv5n63
 12Vgg3CEqm2EAwXuO+K9A2gLbsMWV07KDVal8mgs+OMKvZ8GrgBfX/7WTlvkjj3v6JbIQmlQV
 huKSm0Gv+khQbdmAQThhd/klkRxRDDd8FEb6R5wl/9m9O3uGA1x5FkrIlPdr783oS4t4/Y/mp
 qwQkDUbuvyRsnR69V1HyIDZKMi8FuwofVnmZRgo1WqcviPLJW3PQKvVU1qh5/aIwnfrg1kin+
 vaNpUy9F5TspjPhlTf35KlZaQL56V9ATB1tKKKCHZoxvzOPIBpu7kST+iFyynL8aGT9sQTLrE
 jo98IAxuOET+LR16X7KNHuTGKGVPTTQnlerA0ogW2r2IoEce9z9WvthgXLEgKJYi5XBdQV7H+
 Nav2yK4ObULITv0KiYDRS9Pj69sPz2vO5ILFZLgv2AijdZpOZocWqOxK56CDdCu7TTeM0l3/Y
 dWbjLri1EvnJoSw51SJtecsfoegvllfufY3SCqaKRftqz77GtRaxdEaAfj7mwZ/gI+plZngd5
 Aw8siV1RZxJMrvJkn4npHJgzkq85+7yHb3Xy3Ksxi8iV55NKpBZFeDG9MotsEI8OwVOM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_084527_017692_FF97EC5B 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Dienstag, 18. August 2020 um 09:36 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> >David: is it ok to squash your mali-commit with mine moving the other
> >display-related nodes and use me as author?
>
> Absolutely. Can the U7623 patch go along for the ride too? Was there anything else you weren't including?

i did not included the mt7623a-patches because they are not related to my hdmi-series ;)
but it should be easy to add them on top/separately

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
