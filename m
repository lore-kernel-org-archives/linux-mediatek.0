Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F3DC2D0CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 May 2025 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yBuQ5l0rtMBBlA7JVW8TMJSgA73vP6QAfrH5I/J1V4=; b=fOhwDXBKqvfm5tGvo9CT9XgSRj
	jmLm2sqCdYo0EJVFEVB+xa0GwaHr5fdQVNYdTKO/wsomG3tWrk7o8Mss125AbyhngvK/kG0jIwKUy
	2LtayXKxMIE8d01gDkRHOB0IKvtc+Rv+pXVIBpZPMEwOFNe32/lJ4VAc5eQFnS8GDjMnbDsDXS6fU
	J6awhmWPfnWwa5ah4/4a/hYsxT+LouqNgjWL7ezJX7ZV3vvekKvIWqsAFh4PeS1t2lleZAFmzC+4t
	fYWTj9h/kiOsJV7MgCX0Cth3rWVhkkT851lpFkxgeHqol81FWjyhEITIZBoobQ+8jpW8zKIuDqsaX
	v154dV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuFT-000000088Yu-2INH;
	Mon, 19 May 2025 06:45:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGuDP-000000088Gy-09rE;
	Mon, 19 May 2025 06:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CC064A703;
	Mon, 19 May 2025 06:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7388C4CEE4;
	Mon, 19 May 2025 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747636990;
	bh=Yx1POljrotCIOHaWzbGr8GsvbOuA+Q2oSlphVN9dFyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFJWYJ3aD0LD42aTLgS7rWRD6M3842RTrYNQvix8F2UsS0QWl5IMdSeYVXCNs41u7
	 haTgRlRewO1qVE5KwSPzIHR1LRkLvxHTW4qQWEVp712/7mzeQ9TTE6aqtt+OMuvSCx
	 hzl7NHYnmHLhyrps/FKyMlJNiJJ4NSYDUc96uyV7zL3ka/mqPMtCWuPldHBXutYk/l
	 HzO8HCo3tDDUGNp01ejXhGAaoCrs5Er9BNSDI0SNcRa51adNwEBn/22MygGjLg2fYn
	 WFL+0J7Qw4Yc3XH7mOyE3Pa1IW1eSvler4r92MeeYCEN98/bnvMuCA1nQozsr2nqzB
	 /1mu+qfOfhl6w==
Date: Mon, 19 May 2025 08:43:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Subject: Re: [PATCH v3 04/17] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250519-dark-warm-squid-4bdae2@kuoka>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-5-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-5-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_234311_098067_97FD4878 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, devicetree@vger.kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 15, 2025 at 05:34:16PM GMT, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>

This was not here before. What is happening with this patchset? Why some
random SoBs were added?

Nothing like that was explained in commit msg.


> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 

...

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        outproc0: outproc@32970000 {

Drop unused label

Best regards,
Krzysztof


