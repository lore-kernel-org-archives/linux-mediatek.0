Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C30DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 03:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jR+VVIPvS013RwwOyv9cfoMQl5yc6ReSCVoS5GbiS4c=; b=dud89TV8xgCaKT
	iFbAqd9kBlGg7X364WPQUMZtXgjRVo3C6E9EuFFAHE2wtbCKhGwuQptWTOuxh7z5RvMpy2cZ6dWsx
	9k+UMi+Hcbsy9PNX12j/5yLnqigARlFdIJ0ZbOYJPASJF4j2Re5NEc2UkYt7f5J6Rw/wzME1qZHnx
	fHAksJ6cOqrmPsA8FKfRP1D4LxyyS5Nib0fLVq92cPSfNCt/QF9hEQkGbT1FrCMWq40BXcKAa8k38
	a95v5ezHByWEsYtyYSOvFQ8kQuh62NP2rNUSgA9W6Aevlv1PInkhBnVgW6AH7SsiJ9fvHDt2oLq24
	xXT4diw1jnvZu9ZSgZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkcA-006Rbt-8E; Mon, 11 Apr 2022 03:21:18 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkc6-006RZj-4F
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 03:21:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id o5so1431084pjr.0
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Apr 2022 20:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ze0ESBmwKUOHj/pycolgwWuWoCj7yCyL4oV7/1CC0gk=;
 b=r8gy3J8rMVFjQIjHPbwRym9TBFENrWtto7E2A6+AkR6eBn0JxshuknH+A3eOEMMMzL
 lxnnV/b+N11DnQiMuvrN9X4pZBBvsnzmYAB5psULHPnQBH4b1EvVRsHCjKLY0gxp7pnC
 A9rO5l939eTP1M1JBeLV8HXVS0l2026NMTfJhek+KzX14gv3hAfLot//r8hnNPMymRtw
 7L79JbnOf7w0ipcQnYVZ34fIizcZoCfiBThxkA57xn3ckdowJyWFWQOTB/x1dK4W7yv9
 VzskU/mzN7kAFrQ67Qh8QED8lZBcBQNxhHitWI1c6WWGuyaXCY2sB+wLTMaIb0Vy/3Su
 0gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ze0ESBmwKUOHj/pycolgwWuWoCj7yCyL4oV7/1CC0gk=;
 b=VvixDxesEBILcQPzxVu/UGArk3nv2V5kzj33BO1PnVtxUAJx+1505gVBKm50CdlsdH
 tcUaxtNVSdSSxXuneJHGqqFd87llKV9ISsKsHd3GkKNDZoqCn/VYh1Mz0t/UktA4f+8m
 NoYASo292QuEAwnxYBMBTh/6F2kv/REyKqHKxSksAbWxs6a2LzqL+hIlcRzyzMQ1EqYz
 1F9v0baaUpuEP+c0b7HWW5/YOJROm7mOeNicTCmVllzd3jpGu8/OucwuNzyvAMM/BPTz
 g1SbGplqAdPeaCh0ubIpoi3BsCMniLi9Kzqpzk0nLOIGwJF47jta9tc3KAnqqHRTw170
 D4bA==
X-Gm-Message-State: AOAM531VOJg5wzNMM6bTXOYqoHx6/Z4QPreQPM8F5Pxe83V2U0UTYta4
 jL2vKgjEcDzyyxbeB7gDNTmIMA==
X-Google-Smtp-Source: ABdhPJzWfdSEYf47igK96LjdYnx9LWMRrxKFmfQEzCgnRi1hvZjIBDq7xUULOljhycVBX/LD3Gzhpw==
X-Received: by 2002:a17:90b:4f43:b0:1c7:552b:7553 with SMTP id
 pj3-20020a17090b4f4300b001c7552b7553mr34412395pjb.117.1649647272653; 
 Sun, 10 Apr 2022 20:21:12 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 w187-20020a6230c4000000b00505cde77826sm337396pfw.159.2022.04.10.20.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 20:21:11 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:51:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com,
 hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 04/15] cpufreq: mediatek: Remove unused headers
Message-ID: <20220411032110.tgk74h6vciix4eof@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-5-rex-bc.chen@mediatek.com>
 <13c1bee4-f9c0-2ca3-1f6c-ee60f090bef2@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13c1bee4-f9c0-2ca3-1f6c-ee60f090bef2@collabora.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_202114_208371_F9C67BF5 
X-CRM114-Status: UNSURE (   6.33  )
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

On 08-04-22, 15:36, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > Remove unused headers.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
