Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF27AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZeIhb3fqnfUnJd59yfyLJJmoBp7Kjl/67o9t6auf+NQ=; b=dR9xuqsRvVea++Ik1OqWjv3NfM
	RymiytxXH3eM0+tNSQwLHq7xdClkO1HgBwPdXWqAbWSZkAp+eigpNh4pBjx9Ejh+iyWlrqblBqFDh
	snN+CQF44xCFCdTN5V2zps1NdvGpHLFjjgSTO3QEq0zD0LDF7bP9Wskz8oxBm/sGJTZW2kaqDITd2
	KZjBYspO3/tqo7w/DE95ESyiTmpdU77bzTT1SjupNfKTzf4815nuVWItgTGdfjIanoixkrOXegNE9
	XxGs0zMSh1zKNhZpOxgEBcpVhmUq0A2RuIgkpUkb48R3+brzDePZcHBrVFgNuDkI+377MjOY/iKCB
	YICKi3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4126-00Ao1w-Lp; Wed, 22 Jun 2022 14:08:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o411q-00AnvU-P9; Wed, 22 Jun 2022 14:08:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so11156458wma.4;
        Wed, 22 Jun 2022 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZeIhb3fqnfUnJd59yfyLJJmoBp7Kjl/67o9t6auf+NQ=;
        b=bg1rYK3aOnpstgV5X8JCVaDxfceJZZ+RnGbdMAR3z0JOQaj8FAvyLlvsXswGx4zP2f
         +pwmfDO1TCJP9j1hgOBk3MKDRWQidXRKiOsmPR9To+Lplruhu6v/Ic07mVynXLabvHdH
         oR5ypF0BUqVcSQ2L3Yjdy8y02iYsYrxPGwmo1ruYebDXAKzlKFhx5p2ECB+PFTjjac+Q
         Z1iPJJeIsX84zpy21pYvTcI2BIj8zML4PVMwdyL7oP91c1wjx3HFibDfmqri6XA6pl2/
         6MAogt3P2Fxc0r702Kp911Tdx81yozjSlrJ4bV5a59mVLgbpfh9yuKaKhUn2e54L7T7y
         3ZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZeIhb3fqnfUnJd59yfyLJJmoBp7Kjl/67o9t6auf+NQ=;
        b=ux5ymewO/BRJvhPbA4gHdAmQiAXefrPUPZRMsw7w4/dmtvRG3rAtwlmh7jr8MmjF5y
         QYPR1IH06nA3W2M3pAP4auru1cE3g02I0PnKk8DeEXknv77efeIazTjH61FLzY9Xmr8+
         iDxCNy/oV575FVpMFvqri/U6VVRKsZpRHOvcsXabAv8c3VljsMhdJm+0sW+6cpl1rmpK
         Jgt5O7oefIHtmqL5Xgg55S3kKQhTVfdq90EVAIZfzQIjQKVV+V5MYxpxXpaWg67p8tqR
         aujWJEYgHlM/ZzplEKwiNC8ZYHX+i9QncCJ3eyrUUX/3lswwQo97xXYJ5xwk6HaaX2Uc
         1Vvg==
X-Gm-Message-State: AJIora/zJgpdLTDxEfBaKCNUv7xupZ/kVS5VwqzFsClKb5vxWFXd5Dkg
	l2jVwVtmu0h9FrO0K0eSJJg=
X-Google-Smtp-Source: AGRyM1vgoX0sI0/GRhToJAs8ji8QUFOvvt8sJNBlMLAEP22kjBbSxxSrn5djZK1qdK3AMGl1UgmRpg==
X-Received: by 2002:a05:600c:3505:b0:39c:93d4:5eec with SMTP id h5-20020a05600c350500b0039c93d45eecmr4138902wmq.179.1655906899095;
        Wed, 22 Jun 2022 07:08:19 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6b81000000b0021b9416fa13sm8265850wrx.90.2022.06.22.07.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:08:18 -0700 (PDT)
Message-ID: <3de83337-389e-4fd0-b6a5-c9deed31ef19@gmail.com>
Date: Wed, 22 Jun 2022 16:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/2] dtbs_check warning fixes for idle-states nodes in
 mt8192.dtsi
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, James Liao <jamesjj.liao@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220617233150.2466344-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220617233150.2466344-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_070822_830995_DECB4649 
X-CRM114-Status: UNSURE (   9.19  )
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



On 18/06/2022 01:31, Nícolas F. R. A. Prado wrote:
> 
> A couple of simple changes to get rid of dtbs_check warnings on
> idle-states nodes in mt8192.dtsi.
> 
> 
> Nícolas F. R. A. Prado (2):
>    arm64: dts: mt8192: Fix idle-states nodes naming scheme
>    arm64: dts: mt8192: Fix idle-states entry-method

Both applied, thanks!

> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 26 ++++++++++++------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 

