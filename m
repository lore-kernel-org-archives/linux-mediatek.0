Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A51C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 845476113C
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 845476113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bocqlGkn6gC95mhnmX4Th7aAsSPnH7ujs7gDLK76m4=; b=Mbl5QfU+0/0zuI
	fytKGK/h/LoR7daobRKY62USmZkLnkjM9fiHY0AxiStxZnfE0LmkzL4XPvV4tXGm2G1M55ViHZev8
	4Id+1w27xfXMnZSh+iMf7DnHxDwLk4uI115mJQHCh0ykDzSfvpgqa4YJ7DMaPpMZbTpIeFxpr6rDA
	MtXK6KUW5zIFAZ2CeVh4DTqupFBm98UTTGTHdOP7dzDpITghtD+lQCmkiIjlilgxq093tvgPkcvC2
	4PxTq+BDBKWds3bdXYnFHt1siXHsMyAInJOumxKPsGsDdrFxnKJyLc4sZk4JoZetkkt9iZl2J+4kX
	WEJjJpcZuEO9K1o8WJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrFX-005coX-KO; Wed, 08 Sep 2021 06:39:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrFK-005clP-Tq
 for linux-mediatek@lists.infradead.org; Wed, 08 Sep 2021 06:39:48 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNrF7-000821-T7; Wed, 08 Sep 2021 08:39:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNrF3-00031K-86; Wed, 08 Sep 2021 08:39:29 +0200
Message-ID: <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/17] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 hsinyi@chromium.org, fshao@chromium.org, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org
Date: Wed, 08 Sep 2021 08:39:29 +0200
In-Reply-To: <20210908060312.24007-8-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-8-jason-jh.lin@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_233946_991389_B4065DBF 
X-CRM114-Status: GOOD (  18.00  )
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

Hi Jason,

On Wed, 2021-09-08 at 14:03 +0800, jason-jh.lin wrote:
> add MERGE additional properties description for mt8195:
> 1. async clock
> 2. fifo setting enable
> 3. reset controller
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,merge.yaml      | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> index 75beeb207ceb..0fe204d9ad2c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
> @@ -38,6 +38,19 @@ properties:
>    clocks:
>      items:
>        - description: MERGE Clock
> +      - description: MERGE Async Clock
> +          Controlling the synchronous process between MERGE and other display
> +          function blocks cross clock domain.
> +
> +  mediatek,merge-fifo-en:
> +    description:
> +      The setting of merge fifo is mainly provided for the display latency
> +      buffer to ensure that the back-end panel display data will not be
> +      underrun, a little more data is needed in the fifo.
> +      According to the merge fifo settings, when the water level is detected
> +      to be insufficient, it will trigger RDMA sending ultra and preulra
> +      command to SMI to speed up the data rate.
> +    type: boolean
>  
>    mediatek,gce-client-reg:
>      description:
> @@ -50,6 +63,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
>  
> +  resets:
> +    description: reset controller
> +      See Documentation/devicetree/bindings/reset/reset.txt for details.

From the example this looks like it could have a maxItems: 1.

> +
>  required:
>    - compatible
>    - reg

Should the resets property be required for "mediatek,mt8195-disp-merge"?

> @@ -67,3 +84,16 @@ examples:
>          power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks = <&mmsys CLK_MM_DISP_MERGE>;
>      };
> +
> +    merge5: disp_vpp_merge5@1c110000 {
> +        compatible = "mediatek,mt8195-disp-merge";
> +        reg = <0 0x1c110000 0 0x1000>;
> +        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +        clock-names = "merge","merge_async";
> +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
> +        mediatek,merge-fifo-en = <1>;
> +        resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +    };

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
