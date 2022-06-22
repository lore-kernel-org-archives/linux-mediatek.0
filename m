Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2916C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpleBhi5f5r0iw2+2sLLv8AIuLh7a6iCpi7m4JTAHkc=; b=YxnfesjrXjy621pbvrJOgsCceb
	wkA3xmVRnJri+skqZt40fH2o2vzXsqy93nzjxXD+a4L3O8gs8DwU1iCbGQ+FPX6Gxb7hHPcXfV81Y
	pU2MMOcQ9L0aTc440cUYBlLivysczJ/yNwlaDEmA7Bw4XIw76JLNwQAQGhvn+eHf6o5UKNr7597Sp
	nM+8c78n4YKzaTVQoBMLoaRBdoQQ9/8ndfkL+xuRmmnpOmxycIkRda2Y+xq58WlCRqK8F/TrtnAQ/
	noVEkqWvIawVLgi11hDX1fE9AWb+ZYjFQe/it64EjKHsSzx0/mHBPSstZGB/aEXj/WdUHSpqJLj+d
	y97wUoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3uAf-008vXs-Fw; Wed, 22 Jun 2022 06:49:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3uAO-008vP6-Tr; Wed, 22 Jun 2022 06:48:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57A34614F3;
	Wed, 22 Jun 2022 06:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E55C34114;
	Wed, 22 Jun 2022 06:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655880523;
	bh=zM0SW3vqNvu0Oc6om+TTIoJUvS2PT8GEnviSnb9hLno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmQzKyb3CG2gPCAVJkj+/LikY9zwkW/roOS6Db+Gf/QOqKsegmYt85n7+SdefA31H
	 OA90DiFFcTRC8MPwNm/G/bhIPujlIXjzBK/3jeZqYd8ckmg8BTLhRalTVMBB8WE37G
	 WT1Dojj2sBqWI1BUEd9ltg/tbiGenB7NSv9xJD98=
Date: Wed, 22 Jun 2022 08:48:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Wang <peter.wang@mediatek.com>
Cc: matthias.bgg@gmail.com, len.brown@intel.com, pavel@ucw.cz,
	rafael@kernel.org, stanley.chu@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, martin.petersen@oracle.com,
	avri.altman@wdc.com, alim.akhtar@samsung.com, jejb@linux.ibm.com,
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, powen.kao@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com,
	tun-yu.yu@mediatek.com
Subject: Re: [PATCH v1] PM-runtime: Check supplier_preactivated before
 release supplier
Message-ID: <YrK7Q7yFUIHRoKLS@kroah.com>
References: <20220613120755.14306-1-peter.wang@mediatek.com>
 <a6ed562c-5ec0-231d-0eee-a35f2ba7a344@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6ed562c-5ec0-231d-0eee-a35f2ba7a344@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_234845_039879_AAEACA20 
X-CRM114-Status: GOOD (  12.56  )
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

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top

On Wed, Jun 22, 2022 at 02:09:16PM +0800, Peter Wang wrote:
> Hi all,
> 
> 
> gentle ping for this bug fix review.

It's only been 1 week, please give us a chance.  To help out, always
feel free to review other patch submissions.

thanks,

greg k-h

