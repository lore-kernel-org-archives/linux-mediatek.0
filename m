Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3EBC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 11:09:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4E064DDC
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 11:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4E064DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5RRCwMCvE4C+YWbCJ2cJBqWCF17q3bwLwXG1rhnQlU=; b=0FbS0bHhmJ/dNPkp89d8818KQ
	aba9YJvI9S9fGyvd7pnJ5HqIH66bZxclH/VnsoPDicyXqkVi9twEnwBw9+gtsZeKW0I/K4ODtS/nN
	oX7g/7VH09EaYZiohVEF3OFNMyapJrAF6tv6f8Egsx4g4gz1dfMRAPBlBB+8GMAgx9oWy9zvpSkVM
	y1K0Zzvkn5AsF4Oebn7eh51mnFGoQdFmA52XoXVwyNKGEsX+ppQenQL2DZQqYKMc7cB4dmNhaH3ss
	UC/N2PV2FxGD9qyuHFnuz+xuwWxBvVlCZVUXKOfMF25LVR8LJypmphNeJRsVraiQtuhIcO5txydbs
	DbUsQkNiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6tZ5-0002wl-Pv; Tue, 02 Feb 2021 11:09:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6tZ2-0002w5-I0
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 11:09:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35B4D64DBA;
 Tue,  2 Feb 2021 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612264183;
 bh=vFq7NeMfV2przweTzpyrmikuLaJJ1nfz6/jdCK3tvEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GX2Qcv4WYw5IZEx26CjLWvUiGDL/karsEKhSceYQZLLruY6Ewbzels1ZEvisjawhZ
 D3qzytq1cwpJMnQYocZ4IcppouH+1Wz/3j4vgxnWqxGrIUtJJy4W/d3gEeFF7iZ3li
 kb1nfedYhgalG/kXAJqES4bf/+V2ZQ8jhpyKFUWQ=
Date: Tue, 2 Feb 2021 12:09:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] staging/mt7621-dma: mtk-hsdma.c->hsdma-mt7621.c
Message-ID: <YBky8lfQ1DmuKtRL@kroah.com>
References: <20210130034507.2115280-1-ilya.lipnitskiy@gmail.com>
 <20210202065438.GO2696@kadam> <20210202083117.GS2696@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202083117.GS2696@kadam>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_060944_675274_019390B5 
X-CRM114-Status: UNSURE (   6.06  )
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
Cc: devel@driverdev.osuosl.org, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 02, 2021 at 11:31:17AM +0300, Dan Carpenter wrote:
> Apparently this was already merged?  Never mind then.  Once it's merged
> it can't be changed.  No big stress...

Sorry, yes, already in my tree...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
