Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B0BC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 14:34:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB1D32063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 14:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB1D32063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Di33P2CwZg4gvaOJxn1qrH25a1oqfyGtkDDdTL/JcCk=; b=FLfc0pXnA/iXD4m0JSuOLBjz7
	gPscm16je2UIOI2334TnLK85fcdrYXZasMYQTwePktJWJrkeRUaNASuFS3g66t6Tw9dpNLcwkfzzm
	OcqZESI1IHZTEDRQgFnPFVKdI30XAdNaOCTo00rQBm8xCHTR7FXhgrfmr1ne8G0MuC/Or1BIqlZOj
	k79zdSL9ux652sJ6paByM/JW2skAsEGAAU4wZR3ecF+hIKY0ny84Myn3OX1Iu/QqRhTUxLMmLEskK
	7JAuqkvx/I7UPG9+MoVPBRSBZdTo4JdgRtiS+f8gsjxYqt1uIexXRZBwAsxi512rL8pwRhUHgSUNJ
	3uYTcXpSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kttbP-00014s-TZ; Mon, 28 Dec 2020 14:34:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kttbL-00012n-Ok; Mon, 28 Dec 2020 14:34:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 450D7223E8;
 Mon, 28 Dec 2020 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609166062;
 bh=Is9XbTyMnMpitr/me80eTOa4UNjGDk+Wd80fgtYldQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tPoiBHW7srGkxORxbM7TK7a5ex8WPPKpJrx4I5G7I2z40mOwgIhNk8NhDN62iw7+5
 v34g7D3GJPQlvh5OptOaGxZLvXWvOjS8mLnWL5+zER/kgmto4vPFHS6U/+YVrmFA3Q
 22CgJMOdfhwQoDYFYKhUnBWI3klip+UBoOAGn0vg=
Date: Mon, 28 Dec 2020 15:30:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v4] usb: xhci-mtk: fix unreleased bandwidth data
Message-ID: <X+nr65vhINCw8fCL@kroah.com>
References: <20201214131640.v3.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <20201214163945.v4.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214163945.v4.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_093423_888961_264D5C68 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 14, 2020 at 04:39:53PM +0800, Ikjoon Jang wrote:
> xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> to handle its own sw bandwidth managements and stores bandwidth data
> into internal table every time add_endpoint() is called,
> so when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
> 
> This patch adds two more hooks from check_bandwidth() and
> reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> from reset_bandwidth().
> 
> Fixes: 4b0f7a77fb3c ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")

This is not a git commit id that is in Linus's tree :(


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
