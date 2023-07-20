Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D6EEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk0+OfIBVrjxdxyJzd6k7bKe62s4LYJUT+/V2wesyK4=; b=ly17kPao325biqaOUJnRSGdNmw
	N26DH2AoE08TbK9H0W36xVlBOsz5E1DRJASD6QDvAXW7YNXKtRu7pP22Cz6aNdCSi/doNydpA3oae
	PUManGgFSYggccCfsvYWuvmYvDA493FhPVzvQ5YD7OeSx1R0kf92c7kWACvTXgj1b0khGdy2yXINn
	FdUwwUUW5s6o9MJwYyfbHLBMhsaK26XYNqMwEIHdvnZu8bHzp31lQl2dHnDETiwBJe7RX8Y/yKzfi
	p5hTF4pcwj9CjuWQuQz9AxTxCAmHOyCukVAv6rAZaRAakHy27wfd2K1TMeVZCqyfiiLs3FwqTdIOG
	NcDDAgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVCB-00BTde-2c;
	Thu, 20 Jul 2023 15:03:59 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVC7-00BTb6-23
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 15:03:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31441bc0092so735669f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689865431; x=1690470231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yk0+OfIBVrjxdxyJzd6k7bKe62s4LYJUT+/V2wesyK4=;
        b=HvrixRAIL67I2qRJlTd4cc4z9glJkuSXOv1aDPxuTIHyLZ5BSGbNepxqA3n9t43KgE
         LBNT82RTszenAssbCx8M1uPIjpd0Ga+VOzLnq6OyFtAzpVQFfyqIHXafX3CHjQQEd+NS
         VWcHimCa5DPA9BQDKkPGcgLs1H3rql+tVoNrRRc5mvp+uIQi1VNB+fldBjbuDabP6L+Y
         8dYfAF9ew641dJCCXIANGFdLugHY2oxVXI2bFgK7ZyX3PbaFwNVP35RxC7uFNQ9jBQt1
         UR5uKK+kQodIL8dGRKlnO40omGFnZ3LRz/tJ6pX+75Kh1+xxemuvvap0HTtLYhqILSpR
         v0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865431; x=1690470231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yk0+OfIBVrjxdxyJzd6k7bKe62s4LYJUT+/V2wesyK4=;
        b=T2B3oZv/80qUlhltNpe1DlRwS0ycSkzU0QXuOcy+4Obqpkkwr3JlbsK5gZhewpiB1s
         +xKcptSLAoOXEhUcSPHgEVsZ5K1CgJaLxgjAK/lbFN591IXh5DspmqHqJL3QQqklUDHS
         drI7x9pXRw/bx4eWOoe+Qi1z2GiseqECI+gPxLOaHoM7VrVQgTOu3dNorg+pjVEzmGmm
         IrcMxKBfWSD3l6gTdz2CjEHkYjkFghAlZmj93pQsaS+2QwVhe8yL+7DIDlcN1weh73B0
         7akCQ0YEIoUncKXzv+PT2/1olM7A14AtT4nFMPecw6iegmxi4glFq5UfcigSU5vS7MPB
         aIfA==
X-Gm-Message-State: ABy/qLbTdNq6SItcfJh66SvIix/jE/t6WL5npB12WeUqPKFlxMox57sc
	pr+e+WSGpmIyJJq7OV7Ge88W77+WqVcxyrrGm2c=
X-Google-Smtp-Source: APBJJlEnxpnc6Eg6VtavPczW2DTVI9oBNtJTq6mn0UUWeRqPv/nKBvuumDIPWZPdrtpXnWvrphAq/Q==
X-Received: by 2002:a5d:4c4b:0:b0:314:1f1e:3a85 with SMTP id n11-20020a5d4c4b000000b003141f1e3a85mr2051958wrt.61.1689865430880;
        Thu, 20 Jul 2023 08:03:50 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d6b8c000000b003143c6e09ccsm1589783wrx.16.2023.07.20.08.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 08:03:50 -0700 (PDT)
Message-ID: <a3502c0b-d0e8-9166-b6b4-8f40650636c7@baylibre.com>
Date: Thu, 20 Jul 2023 17:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 10/11] drm/mediatek: dp: Add .wait_hpd_asserted() for
 AUX bus
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, nfraprado@collabora.com
References: <20230717141438.274419-1-angelogioacchino.delregno@collabora.com>
 <20230717141438.274419-11-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230717141438.274419-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_080355_672259_56B0CD5B 
X-CRM114-Status: GOOD (  14.86  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 17/07/2023 16:14, AngeloGioacchino Del Regno wrote:
> In order to support usecases in which the panel regulator can be
> switched on and off to save power, and usecases in which the panel
> regulator is off at boot, add a .wait_hpd_asserted() callback for
> the AUX bus: this will make sure to wait until the panel is fully
> ready after power-on before trying to communicate with it.
> 
> Also, parse the eDP display capabilities in that callback, so that
> we can also avoid using the .get_edid() callback from this bridge.
> 
> Since at this point the hpd machinery is performed in the new hpd
> callback and the detection and edid reading are done outside of
> this driver, assign the DRM_BRIDGE_OP_{DETECT, EDID, HPD} ops and
> register the bridge unconditionally at probe time only if we are
> probing full DisplayPort and not eDP while, for the latter, we
> register the bridge in the .done_probing() callback and only if
> the panel was found and triggered HPD.

-- 
Regards,
Alexandre

