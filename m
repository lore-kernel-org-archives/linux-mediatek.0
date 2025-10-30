Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1987CCF9F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Oct 2025 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiMIADOUWl4dP+Ao9sQ6FdrfLbz6hFIXFfgN4vVMOxk=; b=dAtMJYIMW7uwlT+QHMIdrB/K1k
	bZI5G5QAvD48vysNi1BUdDDl8bysjmTNr318lOlx7tZDJ42OSN4qPmiQmEIfD4Qwzxk6AohZFKrQj
	EQKc2E1WDzNZKlJg1kOsJhXw0vQKt/dUjbDGNLNac8WaPMkoEENO6Nw27zS4RhYX+8oXIPixBHneE
	KguwxXKDzNsmS8oGsRqaH5UUIVukeNs4QKdMGxE5S2GnCW5fQU0Wf3+4fxEeJ4ohLxn/IzbYbVsRb
	OZsG5aRu7xbEvYQeLw6i99M7gLQhZ0v52xhA7QfcGHXp6eDcjT0K97pX7m1IZ2vPet6ABtxXnLPh+
	TxxcpSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVkk-00000004TlM-1yZS;
	Thu, 30 Oct 2025 16:43:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVkh-00000004Tki-3wVk;
	Thu, 30 Oct 2025 16:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5910444D21;
	Thu, 30 Oct 2025 16:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E606EC4CEF1;
	Thu, 30 Oct 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761842635;
	bh=ujITBpWROV8ondxiVfL/J6xD1Tt12xz/U9auSnzcR8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7J9+pLN4ro1WnlD5NBbTiIzH2s+io/jV/gv88R7hqwlbYeA4mPsYn7fBm30ClI/a
	 IpvJm0zIYzgW4YiDZzkOh8/xxxvj4MfQL43SGPpjASn/ocWWpN4ZLwAFBpRkjnYIlQ
	 NV5zkO9SkqzzkUk0EJ1kHNmUa5vPhF3nxTqJbZltUcFWGUJ+0UdYE6qhNe17po9eQ9
	 Q+OINY1l/BDDwLKFXB9btYbK9Nt8xceUyvRb7f2zbBo+TfrvuHVyf2qZs7T4qQhnOi
	 wOxm/7i5hUTLV2rgWn5feK172vyaRE1Cs3aLKLvhfn+hXfBT94G2eoJSWMNHJcGc2c
	 ib7bduylhBWgQ==
Date: Thu, 30 Oct 2025 11:43:53 -0500
From: Rob Herring <robh@kernel.org>
To: Zhengnan Chen <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Message-ID: <20251030164353.GA4119862-robh@kernel.org>
References: <20251027121443.16783-1-zhengnan.chen@mediatek.com>
 <20251027121443.16783-2-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027121443.16783-2-zhengnan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_094356_020244_214E28C4 
X-CRM114-Status: GOOD (  25.34  )
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

On Mon, Oct 27, 2025 at 08:14:27PM +0800, Zhengnan Chen wrote:
> Add binding description for mt8189.
> 
> The clocks number of mt8189 smi-sub common has a bit difference.
> Its clock count is 2, while mt8195 has 3. Therefore, the minimum
> number of clocks is changed to 2, with the third one being optional.
> 
> About what smi-sub-common is, please check the below diagram,
> we add it in mediatek,smi-common.yaml file.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> ---
> Hi Angelo,
> We add a diagram in the smi-common yaml, We are not sure if you agree
> with this. thus I remove your R-b.
> 
> Thanks.
> ---
> ---
>  .../mediatek,smi-common.yaml                  | 25 +++++++++++++++++--
>  .../memory-controllers/mediatek,smi-larb.yaml |  3 +++
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index 0762e0ff66ef..454d11a83973 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -25,6 +25,21 @@ description: |
>    SMI generation 1 to transform the smi clock into emi clock domain, but that is
>    not needed for SMI generation 2.
>  
> +  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
> +  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
> +  In this case, we use a smi-sub-common to merge some larbs.
> +  The block diagram something is like:
> +
> +                          IOMMU
> +                           | |
> +                       smi-common
> +              ---------------------------
> +               |          |           ...
> +              larb0   sub-common      ...  <-max number is 8
> +                   ----------------
> +                    |     |    ...
> +                  larb1 larbX  ...  <-max number is 8
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -40,6 +55,8 @@ properties:
>            - mediatek,mt8186-smi-common
>            - mediatek,mt8188-smi-common-vdo
>            - mediatek,mt8188-smi-common-vpp
> +          - mediatek,mt8189-smi-common
> +          - mediatek,mt8189-smi-sub-common
>            - mediatek,mt8192-smi-common
>            - mediatek,mt8195-smi-common-vdo
>            - mediatek,mt8195-smi-common-vpp
> @@ -108,19 +125,23 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - mediatek,mt8189-smi-sub-common
>                - mediatek,mt8195-smi-sub-common
>      then:
>        required:
>          - mediatek,smi
>        properties:
>          clocks:
> -          minItems: 3
> +          minItems: 2

So now 2 clocks is valid for mt8195?

>            maxItems: 3
>          clock-names:
> +          minItems: 2
> +          maxItems: 3
>            items:
>              - const: apb
>              - const: smi
> -            - const: gals0
> +          additionalItems:
> +            const: gals0
>      else:
>        properties:
>          mediatek,smi: false
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> index 2e7fac4b5094..9a5dafd7c07e 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> @@ -27,6 +27,7 @@ properties:
>            - mediatek,mt8183-smi-larb
>            - mediatek,mt8186-smi-larb
>            - mediatek,mt8188-smi-larb
> +          - mediatek,mt8189-smi-larb
>            - mediatek,mt8192-smi-larb
>            - mediatek,mt8195-smi-larb
>  
> @@ -85,6 +86,7 @@ allOf:
>              - mediatek,mt8183-smi-larb
>              - mediatek,mt8186-smi-larb
>              - mediatek,mt8188-smi-larb
> +            - mediatek,mt8189-smi-larb
>              - mediatek,mt8195-smi-larb
>  
>      then:
> @@ -119,6 +121,7 @@ allOf:
>                - mediatek,mt6779-smi-larb
>                - mediatek,mt8186-smi-larb
>                - mediatek,mt8188-smi-larb
> +              - mediatek,mt8189-smi-larb
>                - mediatek,mt8192-smi-larb
>                - mediatek,mt8195-smi-larb
>  
> -- 
> 2.46.0
> 

