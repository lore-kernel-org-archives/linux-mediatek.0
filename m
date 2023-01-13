Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A6C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 12:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJfnZs4jo54Kgz5HLGIY/C94TyuqRX8gh4vXaqx8qwc=; b=SY/ELzilTqiCwPtMJEOsDdzGYW
	4EmSp54W67eMUTODkdibHutK4AKap5iahv+LJIkK5CmtCVlcZdvs6kYgZvoX7ZfXUCWw8n+vw3OC6
	CvWXN5HgXcNGKI5aQXWNMDrb7atEii2yYsmj1b4nAzE1Lu81tH9O3PoeOxVGSpAjpAByRuzG/0feE
	EshrJwAWLpuFfDc56qVgqLlHpYzhc8waIKNsSkI6LdsFJq/kjjQQoz7jqMeN/qPxbYFDA+MREY2XL
	mAWsAWZwcqJxjFTGCuX2E8T8FtepoHRi10q2au2niY/L6zIP4YOnuvTLwdOhRy/nad8sgjJvX/skj
	bTTAe7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGImE-002QsP-Ff; Fri, 13 Jan 2023 12:03:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIhJ-002Ofz-Ea
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 11:58:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id l22so22071315eja.12
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 03:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJfnZs4jo54Kgz5HLGIY/C94TyuqRX8gh4vXaqx8qwc=;
        b=xz/7KR/nbYYYhHj/GgARzVka0RWlZgXvR8KL/EWM+Dqqnk4bAhFX/oRMaOU/zthcVn
         r8j1WHiNXLTpC6LtFX8mmYWnIUgZ+2Cx3Bh0YujgJVTcVoKpBSQ8Vdqn0mGz2M0MCZOB
         GUcxSAWuUsOzj4fXr7ztt+Fx4SWBJPdgodoJYpx0g+eJOXv0dJmRm/vkIkWvwzYNI85e
         ozQh57PYlC7FzFkdwrkcnv8s1nKArYmrFsj+kpfMokUQRPcpY6T2hrriGCEwf9ctWHp9
         AkQr2hgyDja6oq/l9KdyithNXDba+O0KX58P/p8Hs36aKQmTQK5pFglh1ieuACzpbgQh
         KZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJfnZs4jo54Kgz5HLGIY/C94TyuqRX8gh4vXaqx8qwc=;
        b=gmZ/t2+/1aPs9v9rt/4342Uc7lKVmf7Cu/m3sa4axXzVxn4487D1s0rTC6SVzov3yA
         0bBDl1DRI2MKfHP3AHZZQ1r771qaxXlvaynownwob9bqMney/1W2Xkj1ufiBv7RP3Er3
         BBVnlaPh2ziOsvQCBmFZ1wQLkuuo4iaaITHOS/bUHBOaDid3likOfZbkkPIzXczrxxyH
         3ti5u1NY/Tv6JTlyctU3+1wPe/hWcSqyV7e8EMNev1Hm9DK1KiTlh9lF5zpcBGUpEaH1
         cswNYX9oRzCwXjRrFSJ0Jjk6Kj/npKDBBMlKAfVCYm/kXyOdVk/Bz8MrT5dl8ThhGaOw
         gdJA==
X-Gm-Message-State: AFqh2kobefzaUyxd4SCx/ZTcG680I/k5xpRB/fsZDhrNcf3tqXhkojia
	+2Btisn13zeP/qQxv86KVm1ATw==
X-Google-Smtp-Source: AMrXdXtPh9NG2bS51YWCcldtb0iT3Z5psXpa553yTDBZpJtjglNIRpUJFcZBAJrCFSxgoYo+c07TxQ==
X-Received: by 2002:a17:906:5202:b0:7c1:4a3:10b6 with SMTP id g2-20020a170906520200b007c104a310b6mr67094493ejm.53.1673611091238;
        Fri, 13 Jan 2023 03:58:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ku26-20020a170907789a00b0084d46461852sm6153963ejc.126.2023.01.13.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:58:10 -0800 (PST)
Message-ID: <329aed63-4522-9859-4359-2a450c46dcc0@linaro.org>
Date: Fri, 13 Jan 2023 12:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 01/10] dt-bindings: arm: mediatek: migrate MT8195
 vppsys0/1 to mtk-mmsys driver
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113054304.21841-1-moudy.ho@mediatek.com>
 <20230113054304.21841-2-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113054304.21841-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_035813_551154_61A2CFA0 
X-CRM114-Status: UNSURE (   7.95  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/01/2023 06:42, Moudy Ho wrote:
> MT8195 vppsys0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.

Unfortunately I don't understand why this justifies removal of compatibles.

How do you propagate or instantiate devices is not really connected with
 the hardware description.

Best regards,
Krzysztof


