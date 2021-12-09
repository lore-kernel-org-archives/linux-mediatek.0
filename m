Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6335DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6sAjnW/IN7LJNuWxY6/e9O2GsE4c8SzUYDpGycl+k0=; b=cRzQkbadIqluN0
	4s35myQ1n5ljBTzLfrpYBfVkW0n4tezce2Pr2WrY7kqTePoo6PCelpg6WsjreqATvFtcvvHdIseBK
	7DMJLCTTezgXmWxJpKh8NW2Xlv1BPZLv7U+kNdt33tSmm24eoRUq+SSQxJhQCM+kExf5+FQFSq02w
	7PJ5rZ1gFzCwoFMW0qOLbd59Dmschse0uDoH5uDLQhHK4/hVddO4EnqnaGdKX1cXmS4+qLuj/ylKs
	FG+fh+MsrCH6s5wrz8oQ/k38tZNY0TbosO2+LPi7StcG20+ysgh5jLZFy1TpsMhmdMS1/maoDs53O
	+KqgdkN4uTd8885YBJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvE7t-00FAnN-As; Thu, 09 Dec 2021 07:46:01 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvE7q-00FAmQ-RL
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 07:46:00 +0000
Received: by mail-pg1-x52a.google.com with SMTP id k4so4350203pgb.8
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Dec 2021 23:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S6sljBlTTFv4LyM3w/XYfSB/y8cuCgv6qRRvYOM58bo=;
 b=bTTq3Fc8zqIWiPIv0qyowDZ02fTob/teqhwg5s1M+8upNrw6f6A7/H7BhIbjGTUI3i
 9O7uP9Q7vqtDuY7xp/fO3yVuxhfr3MYcVYj03X5KVsGH1K+jQIPHILMrAccfL97yn8Fe
 LtCjk9Gk+6VOiX1Pb1bjQlFNDukElregC8rqGEIFwpf3LAEcZ4bPyaGajNz7C1hF/fex
 GB4JfcFWKklvnpig+PJ3WswnxelColuNpVWC+ifWgRlWFhoDTu4QoEKooD/3e4AJTFkq
 cMuX+ZfNLjLAhWhRmWHTeyNyXJ+taEpl9uvVvktx7gBZBvrScpxmsNM2zgP/u9B9bD/T
 Rx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S6sljBlTTFv4LyM3w/XYfSB/y8cuCgv6qRRvYOM58bo=;
 b=qvNhdJpX0h9LIGe/Qy5lNpI3119U+cCVMJyEd8mheDdTu1lL742mMb9HCERKKzGwho
 q5KflLbMR3sbIAjXAaoDt+VX7saCSz4SNBx8oJ11iBLugrre3eWaZZev2Dav7bj657xH
 IGiHVEz+8suyouLnC6aw8q+y05b4UtuX3WjDynk5wySxLSUbf8seMgDugffiTHejyL8U
 F4Buzbcy1Yhn187yQWwyXIjfbV7+03CFIqPx0dNxvIfrqt08jxUA0HE2XSTmSBa41xxx
 DE647gNeb97VtEkdiElQQpmNyiGURp9fyMV8w3+1DfT4Sjk6RYUVT+iCF2gvnC46AIJ/
 fOkA==
X-Gm-Message-State: AOAM532WOi9mf0enJ3USjOLbceseVUgtEfkQhJ56I6W1aooBuTpomv8z
 wxJ3VNgi/y4SJv9on96XvfwkDQ==
X-Google-Smtp-Source: ABdhPJy4vLVK4vNJiSv25VuTqdUwuEzS7XUOtNkjDw/CRuoa3MUT3oLkzCtaNr74NgLOMeqWqbReOw==
X-Received: by 2002:a63:2b03:: with SMTP id r3mr32170691pgr.328.1639035956433; 
 Wed, 08 Dec 2021 23:45:56 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:636e:d54:3de7:fbc7])
 by smtp.gmail.com with ESMTPSA id a23sm4571889pgh.35.2021.12.08.23.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 23:45:56 -0800 (PST)
Date: Thu, 9 Dec 2021 15:45:53 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: mediatek: assign correct type to argument
Message-ID: <YbG0MRKHi0VrYD1A@google.com>
References: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_234558_913522_984495BA 
X-CRM114-Status: UNSURE (   9.36  )
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

On Thu, Dec 09, 2021 at 03:32:24PM +0800, Jiaxin Yu wrote:
> Fix the following sparse warning: (new ones prefixed by >>)
> >> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
>      sparse: sparse: incorrect type in argument 3 (different base types)
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      expected unsigned int to
>    sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>      got restricted snd_pcm_format_t [usertype]
> 
> Correct discription of format, use S32_LE and S24_LE to distinguish the
> different 32bit.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
