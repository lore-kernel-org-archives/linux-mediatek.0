Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D2FC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxuj814H2MQdZqEHOJc/hwuTKQN6f+YyCBdMXfIN9yA=; b=SvokDLVo6sdPgW
	UgQbytccb049KyorTxUIRivfE9nNFh/NHex1+2CDYIubCN2cxFXXgRfs6UUEbh8qc+x1T2gn6sQTb
	j4cXV4q38lezDCPJigrY+pjZXRIPzybu4APUcPOG/c8M2T1CPWpzYF/7Pxur5c4+SyMyg8sJjgenl
	kzIuMbJFDllz2VaOdFchxhHJJh1VCZ6Guf/dRfilud+xc6wtPjdMxTqPGvhyZ04Zb1NMee75lJQRG
	NjHgJ135J1R7SSNolRPRvcknpPh9kmkVwqWIDK5HmSpOg27xPSwfm1dG8xV55Pc/2IvHjpL2A8Jb1
	49zDMRqCe4GPGjqc/+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXj3-00CfoE-Rw; Fri, 29 Apr 2022 21:00:29 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXff-00CeJC-JL
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 20:57:02 +0000
Received: by mail-ej1-x633.google.com with SMTP id dk23so17588766ejb.8
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/TLvV++EDU9+Sz3wkOEtxmwoSgaUvAw4LEQYsaVCt6E=;
 b=WIX5SWv8mLLnNLHDSE+0AAdosFTnT4ZyO4KBGzAXt7b7MiOc7IH+1d8Ogm5yRetomI
 ChrvjmRBIj+xjTOp/Yz0lNsE0qRNiGQoSpxDL2wudVp/6UAXEjH1G7ydrM/0EMP35Sp4
 pV8gvaHSrsT4BENxCMwZKqlVh82HK08vgS+50kojFPMkXn7ZihmfomYH4ymztanyVDtG
 yKpu8fhyhnqJdHT9cbG5TQprIyYhcsxvBHSBSgzJRRPZo+iYfo3U5YGbf9wXr5CLRbof
 4Ivm15nfAj+Ek93F/WGAO+IUixz30B0ulyRo1/DwdaSiuH244pYKiPk15GD6n4dUkII9
 5eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/TLvV++EDU9+Sz3wkOEtxmwoSgaUvAw4LEQYsaVCt6E=;
 b=JceCpf3zRwDN0CzQrQ/YRgC8Gflv/SImlN2YMhcqWiYf6uhIpe6TNMzmeIQUWOoOqm
 1l9gDTCHuvsHP+2acPY5vnJ1G/yXrzuQXPRFL5gn8sPStX1MVN5cpDuHLaDWCDGrgqKU
 twajZjDoSVQbFHP8Zd83xg4a/Ctg4mtFiaHug3Ar/766tUiWRoFNgKvdHKzpPQfeR7eY
 91fMF4/DZtDTSWI9MBCJXC27Vx4uYOIGj2ZWCRioZOF3phxSvjotyTGod5fFiwToQeRY
 pD85DEBv7yOJrgnUAocvCXbVrGvbhbW+gc6pP3qHoIAeCmFEaUbXSX3/tGxAtv69n1U5
 X4/Q==
X-Gm-Message-State: AOAM532EtZdWngFLQ51RSZP7lbYIXfhVLnaMnOfafTbU4s1TqtgMT4C0
 02LqKgh7Sue+2myW4xlMZ1x4gw==
X-Google-Smtp-Source: ABdhPJzt2AtJuvcvfhRC2xzmdnT8aaBCt9DuHu6qHW+OGdHit48QJwtwIoEPZbo8wV07pWTnDdTaZQ==
X-Received: by 2002:a17:906:478c:b0:6df:6b35:156d with SMTP id
 cw12-20020a170906478c00b006df6b35156dmr1087605ejc.578.1651265818021; 
 Fri, 29 Apr 2022 13:56:58 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 gv1-20020a1709072bc100b006f3ef214dd2sm981014ejc.56.2022.04.29.13.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:56:57 -0700 (PDT)
Message-ID: <2719abbc-4cb5-b1c2-4c62-ea154a732217@linaro.org>
Date: Fri, 29 Apr 2022 22:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: refine power and
 gce properties
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Cellopoint <cellopoint.kai@gmail.com>
References: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_135659_726840_ED7773AD 
X-CRM114-Status: UNSURE (   7.40  )
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

On 29/04/2022 10:30, Jason-JH.Lin wrote:
> Power:
>   Refine description and add item number for power-domains property.
> 
> GCE:
>   Refine description and add item number for mboxes property and
>   mediatek,gce-client-reg property.
> 
> Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
