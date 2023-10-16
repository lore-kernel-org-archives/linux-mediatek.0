Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74659CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pogla2ixenuu9Whu/Txm0dkQOdChFbDxggoz3QMNrmQ=; b=slbs6L3wZNLVlc6qazUnaNHUcP
	c4kfVz64Oz3zUCpCjj+IUacwsWDn0bNoJ5jhzViMZsZGmz6O0RrSsKHy4ZWc9xosYd2o24RwL8zDJ
	oNQDYa+tlrXiQf3Xm4lIBCXpcJ3qC2sfm0e4RuBFfhVmIvrokpIbFDC3jvWwT49pNwdAVZ8XRPpnC
	OntDvwnDfTjBNBbsIQmgTNsgmu38IqIDqBMOgU2ao3cZyfnDpHXu9ORhewAvHPCcXGEkQewqdwjJ+
	gf/L4hfPUHW5AoSBnS3Jd8efyf+RcrG6lJKusyDbgCHLWRzM+4ZRaKMrBlHY+pqWjU7V7Y6wrN916
	qyxUdjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsOcV-009s9w-1S;
	Mon, 16 Oct 2023 14:30:59 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsOcS-009s9F-07;
	Mon, 16 Oct 2023 14:30:57 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57b635e3fd9so2280407eaf.3;
        Mon, 16 Oct 2023 07:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697466654; x=1698071454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pogla2ixenuu9Whu/Txm0dkQOdChFbDxggoz3QMNrmQ=;
        b=fCLoNf1kQoo/EMu4/1kvM0GEDdIAHqCocVC/h/Tf/m/Ca/3bfrVJuNuUazW8IQ6m8q
         hLvtxiB/c8FL1wpCaLuXL3SWOcLOWGh3AV47YOi6QvM/RPxEbHGwRoqqGjNyVrAmnSYq
         2mH9xB+EbuEmpJTRpCOoKlle+h1kWR11yKgt22jY6KGpvUJm4B7RxEXw3N7Agky5kM0z
         +LUkxgaFI5gQ7NvV8CxeSKcc5vF39sWV75125Es9locbf50TYITDKeiszxt/fyEuqINh
         wBzzo0mMdTp0Oz/zKAmEFQqD2UCIt+SenvoRpg9VB7axuHlzYaRfVdtH/Uq1VsgNwf4v
         DnsQ==
X-Gm-Message-State: AOJu0YwcRFA7PSjW9K3Pm4whveKZpJ16ORuxI+4tyk0CLbX76L1Zj64I
	4jlqDHVpdr6C18kvKzra5w==
X-Google-Smtp-Source: AGHT+IHx8iGwaQriKRdE3MbfGOtdCCNfmu6tH2ejuHsm2/UZEYPWAT5EG1IdyqRY9fD+m2NiQmDXHQ==
X-Received: by 2002:a4a:9b88:0:b0:57b:575f:4f8c with SMTP id x8-20020a4a9b88000000b0057b575f4f8cmr29144162ooj.9.1697466654636;
        Mon, 16 Oct 2023 07:30:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cj25-20020a056820221900b0057e54da7201sm1093968oob.35.2023.10.16.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 07:30:53 -0700 (PDT)
Received: (nullmailer pid 2775610 invoked by uid 1000);
	Mon, 16 Oct 2023 14:30:52 -0000
Date: Mon, 16 Oct 2023 09:30:52 -0500
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v5] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Message-ID: <20231016143052.GA2770481-robh@kernel.org>
References: <20231013140505.483766-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013140505.483766-1-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_073056_098501_CF715A21 
X-CRM114-Status: GOOD (  13.46  )
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

On Fri, Oct 13, 2023 at 05:05:05PM +0300, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v5:
> - removed example for mt2701-audio
> - renamed mt2701-afe-pcm to mt2701-audio
> - added clock cells as required, removed reg from required, in audsys binding
> - removed reference comment in mt2701-audio
> - removed assigned clocks from mt2701-audio
> 
> Changes in v4:
> - fix error reported by Rob's bot : 
> ./Documentation/devicetree/bindings/sound/mt2701-afe-pcm.yaml:11:4: [error] missing starting space in comment (comments)
> 
> Changes in v3:
> - not added Rb Conor Dooley since the patch was changed in a big essence
> - As per review by Krzysztof, also convert the mt2701-afe-pcm and reference
> the correct schema in the audsys binding.
> 
> Changes in v2:
> - remove comment reference to inexistent binding
> 
> 
>  .../bindings/arm/mediatek/mediatek,audsys.txt |  39 -----
>  .../arm/mediatek/mediatek,audsys.yaml         | 153 ++++++++++++++++++
>  .../bindings/sound/mt2701-afe-pcm.txt         | 146 -----------------
>  .../bindings/sound/mt2701-audio.yaml          | 117 ++++++++++++++

mediatek,mt2701-audio.yaml

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

