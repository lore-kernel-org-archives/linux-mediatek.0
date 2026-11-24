Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CDA606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RnHcAzVI;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VdNM4JMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TUdvVe4K11yxE9evuX/HwtIfhtCx4ySLff82ZWhij0Y=; b=RnHcAzVIK5UgQQ
	Z3FSKyh9bzDvuM7hctoYsqUbqPaopcPG8r6Gpmu9JsXbel7SQwij5FPrtWkxJNAJu7tR+U0+VfUx4
	zKWiZtQ9ZUqK4D87/+RuSM6pyjESvvfQl7EaeC/qemV7gduID2k/uuBJ+Nbrp1Uc78z1SaJNsW55S
	wsKLfPXbYz0oqs5JARInRxc8VOUOE2hCl6ZQa4KUT/gEsAs/8MvhVMQMYvm4d9MCYS/AB7uNEx624
	UTioztxsz00BTBVg1ztJ5+MQrTPO7tn0uthC2JQklW30I0+hQ6+0ZyJYPd+vmecio3dFH/6GrFf5F
	x4hq67H9j22Q63eBJQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrm8-00000006o6n-48Yf;
	Tue, 24 Nov 2026 14:45:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrm6-00000006o61-0bNM;
	Tue, 24 Nov 2026 14:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795531535;
	bh=tHoKvhwF6A9T51xIenBUaT/9sNVdCw5DlAXYhy5j/Jg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VdNM4JMq1hqbGTjm3zvuGBEqN1rw1I2PzJOMuy8fKLsiFyo+yhp0z+23IIxxvYMmo
	 9Q72OnZE0XYoWs4phW1UwDX3pAMuNmdvLKZ787eP5IuRx0jfl5inKeoZ0B+zazkaOA
	 SBQAWWI2hzvlDWAlIwu15W0UK0S/A8akEmqHAWEVxRWJ5SfGIFYmWNAVuJDwcxZ/P4
	 0lkpCl5qMxP/p5JaCvoeLBat51+osntHgJa1k0KUE04xznza4gxxj6G9ZN+EbtPlTo
	 g5wlSov76Yg/XZa8ya2rPM6jBIixghlVh2gEYsYPufQ58YEUgaHCb+sapzBsMp6e8S
	 7YhqhSPfauqCA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F199117E0CA0;
	Tue, 24 Nov 2026 15:45:34 +0100 (CET)
Message-ID: <0e279c15-c76f-4068-834f-84c0895f50c6@collabora.com>
Date: Tue, 24 Nov 2026 15:45:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/46] drm/mediatek: Add support for Display Layer
 Blender component
To: Daniel Stone <daniel@fooishbar.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
 jason-jh.lin@mediatek.com, kernel@collabora.com
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
 <CAPj87rMW6c0BMELjn70vsc+mkMxegDbSgQC-8BEDGspFyxzW2Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAPj87rMW6c0BMELjn70vsc+mkMxegDbSgQC-8BEDGspFyxzW2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_064538_361993_77952C67 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/24/26 15:33, Daniel Stone wrote:
> Hi Angelo,
> 
> On Tue, 14 Jul 2026 at 12:46, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> +#define DISP_REG_OVL_BLD_L0_CLR                        0x20c
>> +#  define OVL_BLD_BGCLR_BLACK                  0xff000000
>> +#  define OVL_BLD_BGCLR_RED                    0xffff0000
> 
> We probably don't need a #define for every ARGB8888 colour tbh. :)
> 
>> +void mtk_blender_config(struct mtk_ddp_comp *comp, unsigned int w,
>> +                            unsigned int h, unsigned int vrefresh,
>> +                            unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>> +{
>> +       struct mtk_disp_blender *priv = dev_get_drvdata(comp->dev);
>> +       u32 val;
>> +
>> +       /* Set ROI for this Blender */
>> +       val = ((h & GENMASK(15, 0)) << 16) | (w & GENMASK(15, 0));
>> +       writel(val, priv->regs + DISP_REG_OVL_BLD_ROI_SIZE);
>> +
>> +       /*
>> +        * Set both background color and constant layer color to Opaque Black
>> +        * (ARGB) for eventual Alpha Blending to be effective
>> +        */
>> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_BGCLR_CLR);
>> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_L0_CLR);
> 
> Would you believe that this does not in fact need to be black, as it's
> been configurable since 4c684596cde4?
> 

Heh, that's nice - I wrote this code also before the bg color property got
introduced, thanks! :-D

Cheers,
Angelo


