Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGGF1TQrBDmwZUCWZHTqvwxAcZw9h2WKjow4PVuiInA=; b=ud7rVVHAYNC/ez
	IkVBdwxDLgkTYaSwGquvnkhQADQVjITdn6NaDG9iHVDQN/TRMROC2bSzKdpmuCeCJKKj625UuXEh0
	8dqKIPm7mXkdv8gqmgBMGF5b1kyd+/gCnr64FmplnATw6pOyQlfP46YFYB8LpSX2O9EvFQxjmZB9i
	2Jo6j4ksrPVOzOpJYwmb/PA/IrERCjKG7mD6iRl57Z9Il8OWvgkuWHRqx5ArjeYxfuGf/Bdp3zvN1
	U30lDxFWyy+4OhY/TEMFwM5QoA6XwwldW3FKNbRtBqYB2p7x0xUIMs5s7hgljizicnij9aaEhx7aV
	fQA+GZDWe25BlCUEubTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxxw-00FbrR-UF; Tue, 01 Mar 2022 08:34:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxxD-00FbVy-U7; Tue, 01 Mar 2022 08:33:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id n14so19171706wrq.7;
 Tue, 01 Mar 2022 00:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sSORGTi0IoA/DfZkQJS5hbRydSHYhg9vgr1wsIug+aQ=;
 b=ja8zfW7ZO8t42SOrxjYk/1g1OiNSp6I3dw6entoB8N01FASu2pCL58f84IP5GU0V60
 mpJiaHLcQoMKYglRXYwoMgKufxHd1Rt05Gh3UXxHz6Gg02tgfH4xG7lkJG8QftbNUCY6
 dKMnOZ/I8ZT2FsKNSO6yUJRJ3A3khe7zKm2R6aN+OXT3k3fHDQFe8p9qtHvo+kepXOyk
 Cv9dAdehjwlAxdT6W6ulfXGR0L8HeeUm+ivjepPX/ibULH+1yKvQsUKggFOizYZ8uDYp
 3SiILaMfiNVIroJxUT7jxmpWl29BV6GFnms25HfRp6AvuuxncqOhVtHqx0dnDPfvnW24
 H4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sSORGTi0IoA/DfZkQJS5hbRydSHYhg9vgr1wsIug+aQ=;
 b=P1qdMXkzXuVCxgF7zwX04X7I+RE5c+qLs3vBUG/WWCe3jGj/4kJVfXKL8VYMvQGjd0
 oAgSbReVMKBrowGFBsYNJ+ktf7qj2XX/twZoGgt/m5180Np2PyWk7Y8+mISY3ABUO2ZL
 dHhGw9rQS+E403MAyjdcKEE05l8vGq7rTuL7vMq608SepDRXULDuq5XvduLUQw7CaUL7
 j3jVCAH82Oj3YDITalU5blZ0FVuORap0L/rh7MLIzOcPlyinffYUMEx64zdobNwOoPPW
 QlqPOiBr49XEwz4s4KhTRrQofIgFN+c+tLFQoiHCXv49TYCaxc0Iip4g8a9a7uOj7wb1
 JiFA==
X-Gm-Message-State: AOAM532SQXvmy8uJV50sPBw5I3o2yTyGaUl9ybWRJbQjlnwpS+agy3Bz
 Jp/6fClQAzI5btMoXdnpZFY=
X-Google-Smtp-Source: ABdhPJxtzVKIx0WMPTgOyRFRV+vczvtzK4cPKqRKOBPW2MGsNpFQqh2cqt61LACCM47DKeJhbom5ew==
X-Received: by 2002:a5d:6885:0:b0:1ed:c0bc:c205 with SMTP id
 h5-20020a5d6885000000b001edc0bcc205mr18801977wru.683.1646123634238; 
 Tue, 01 Mar 2022 00:33:54 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a7bcb8c000000b003811afe1d45sm1700654wmi.37.2022.03.01.00.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:33:53 -0800 (PST)
Message-ID: <09ce5aab-0cc6-5903-8238-551085abd739@gmail.com>
Date: Tue, 1 Mar 2022 08:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2,0/2] Add mmsys reset control for MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com, 
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220217082626.15728-1-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220217082626.15728-1-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003356_042541_102B87E3 
X-CRM114-Status: GOOD (  12.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17/02/2022 09:26, Rex-BC Chen wrote:
> v2:
> 1. Change variable type from unsigned int to u16.
> 
> v1:
> 1. Add a new variable in mmsys driver data to control different register
>     offset for different SoCs.
> 2. Add MT8183 reset register offset.
> 3. Add mmsys reset control for MT8186.
> 
> This series is based on mmsys patch for MT8186 on [1].
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220216084831.14883-4-rex-bc.chen@mediatek.com/
> 
> Rex-BC Chen (2):
>    soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data
>    soc: mediatek: mmsys: add mmsys reset control for MT8186
> 
>   drivers/soc/mediatek/mt8183-mmsys.h | 2 ++
>   drivers/soc/mediatek/mt8186-mmsys.h | 2 ++
>   drivers/soc/mediatek/mtk-mmsys.c    | 7 +++++--
>   drivers/soc/mediatek/mtk-mmsys.h    | 3 +--
>   4 files changed, 10 insertions(+), 4 deletions(-)
> 

Series applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
