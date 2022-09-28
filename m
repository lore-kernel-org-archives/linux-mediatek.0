Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBD0C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKkwS0jpz/yD/h7KjcflVeiv6JOjSr4VupQQRes5HaI=; b=O8aRtYcLr4fEb1ERIxYsRlB3GR
	Q5V5+e5QsEAeP93jcyE59rK4DAkWTTZB8EqQhy750QYkA2bA2BHVrpSy8X8V+k9SDJQhNmP2qLMTm
	iCI4tZ6qKkBQn5PppF5FRFbg+uEghn7b+kbKmspZvviGlof0fF3Qg3EWwanf93o32dEgbA5fhLnDz
	bUla26tDyl+nsqFG4ptfZJ5qPpyEfGGQLzS49GzrpPwSpnzCh53Tn4eGqfxIcS7Pm+Z/7XNNbWl0l
	q5USjC/Qvg1jwGWih3XpJldaTgttwmGrPUIFk5l3oeHzFzNqRFTvO5VmNnr56YeXQ8t7TylPE5+du
	TEfWesrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUhL-00Fl5m-5e; Wed, 28 Sep 2022 10:53:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUh9-00Fl1L-Qh; Wed, 28 Sep 2022 10:53:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31E5261DEB;
	Wed, 28 Sep 2022 10:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0139AC433D6;
	Wed, 28 Sep 2022 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664362418;
	bh=YdKCPzIwgdWUb0jK2QuCvZA7ornVgM+pZYMw4TjPT/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2lYCiUMkKfTHba/f9auk+zRJZZfkvFdFIuMB/cibhtLYEBaMAAoyVopkBkCxsCzj
	 dsAFzxGMLa/xxS93flw4YODOP0ldk2apPDC3uNbNRiBFjN0+dasYlr9Zw13oeflRnO
	 GWR2RQcD8GfwwR6WgpZJF5M54ELyZ05iF/7rMr5iRmptSiZudNcTY4LeVIFtL788KZ
	 OX4+1ZvJcfYXIOXh17A+z4Xx4kcoVc3VF5K5HotAo5rUVAwG36HPYur8GGcWCqtV/X
	 KMTzXP6gPN0Qp0wgTV+Oa0AQ31TONQsJ1js5b+lp4f5cuzu0dbAxkvaGPscdL90GSY
	 lE5x+HgY3JJGA==
Date: Wed, 28 Sep 2022 11:53:32 +0100
From: Lee Jones <lee@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, cy_huang@richtek.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: mt6370: fix the indentation in the
 example
Message-ID: <YzQnrFIYXQVdPXOh@google.com>
References: <1663295929-9024-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1663295929-9024-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_035340_054626_343CCF33 
X-CRM114-Status: GOOD (  16.68  )
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

On Fri, 16 Sep 2022, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Fix the indentation in the binding example. There're two redudant space
> charactors need to be removed.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Next time, please keep tags in chronological order.

I'll fix this for you this time.

> Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 'Acked-by' must be added in v2. But I seen the reply after I sent patch v2.
> 
> Sorry to add 'Acked-by' only in v3 change.
> 
> Since v3:
> - Add 'Acked-by' tag.
> 
> Since v2:
> - Add Fixes tag in commit message
> 
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]

