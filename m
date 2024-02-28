Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C9DC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIlc3PQZfKg1TKtz70bkITr4NIWkepEBZaQFeSM9C5k=; b=tTrxjboN+72f+AEi03DkLuKNCl
	AVBdZm4vLLksvITg4InP4t03KfFGCMnr26ZbhkZFdEZorkRPA6nvwxWs6AHNfeOCYSyu3WsSzXtIA
	MUiNLv40xF/vo2qLPsVSo1ochls8nnQsE5kBONAozvk2zxI/wO0y7nCCpzEJQaye9xKBEGUwJNf0M
	7yePqwBYCPiTapXE8YliA7fI9bPQPRp6+x3nJbmKuq+U1kRAhBsG6ApPLztdKA7YUCTHu+Dpt5A+g
	sI6fEOiDtICRg2oXNzN2jQTYxOYBKXlRi7qp85G6uzwkCeLJXmXb17O9rKcVaUg2NbNVfuOq7jk1W
	dP1hfPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGRG-00000008igY-1nau;
	Wed, 28 Feb 2024 09:41:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGRD-00000008iff-06da;
	Wed, 28 Feb 2024 09:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709113276;
	bh=ea/qP8lceQObB4VFfj13TaUrQWQXFF34TOPECYoDbjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u0FaIgGjtWn77xSxsMdY7Ah7fN6y8vAVkMqFAT2IWrS1T+235RFKhCM0cijnDPWxt
	 E6vcuSp4/A0vd2CcChADwEtGX3V8x36vDQJ2mtPAIJn/wQCxr7pM1OKs6+z9pSYiPk
	 yNAn97gtlMyGfATz13onnIYLSsy5u+QMKoE8H8iAXouQbXDzkFeYi2DQ9NtFZxA/IH
	 8hroDEY842dmV2ViuFxDfAliGElxrzrS636j5odIIkNipeO3tG0GT7LPxqv246h7UE
	 iBFIctQhaDwiJ6ubBDEcxYwDJ/2RX6Gxu2cJP08Hv5Zlim3j8pFycKuxxUAkeEp0C9
	 moGZv+eLV0HSg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 724F53780029;
	Wed, 28 Feb 2024 09:41:16 +0000 (UTC)
Message-ID: <6389f1e3-57b2-453a-af6f-6bc7f725ad31@collabora.com>
Date: Wed, 28 Feb 2024 10:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: cmdq: Don't log an error when
 gce-client-reg is not found
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240226-gce-client-reg-log-dbg-v1-1-f0fff97c30c7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-gce-client-reg-log-dbg-v1-1-f0fff97c30c7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_014119_312702_FAF92066 
X-CRM114-Status: GOOD (  22.73  )
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

Il 26/02/24 22:31, Nícolas F. R. A. Prado ha scritto:
> Most of the callers to this function do not require CMDQ support, it is
> optional, so the missing property shouldn't cause an error message.
> Furthermore, the callers that do require CMDQ support already log at the
> error level when an error is returned.
> 
> Change the log message in this helper to be printed at the debug level
> instead.

CMDQ is optional, yes. At least, for some devices it is.

Full story, though, wants that if you use the CPU for register manipulation
instead of programming the GCE (even with threading, fantastic!) you will
trigger various performance issues.

In the end, you *don't want* to use the CPU if GCE is available!

The reasons why the CMDQ/GCE is optional are:
  - You can check register-by-register r/w for debugging scenarios by using
    the CPU to manipulate them instead of having something magically doing
    that for you at a certain (pre-set, yes, but still!) point;
  - Not all SoCs have the same amount of GCE threads and channels, some may
    support writing to IP block X through the GCE, some may not, but both
    may support writing for IP block Y through this mailbox;
  - MediaTek chose to support both ways, enabling means to debug stuff upstream,
    the other choice would've been to never support CPU register R/W on some IPs

    ... and btw - about the last part: Kudos, MediaTek.

Now, I also get why you're raising this, but we have to find an agreement here
on a different way to proceed that satisfies all of us.

First of all..

Which device on which SoC is missing the GCE client register DT property?
Do said SoC really not have a GCE client register for that device?

Is any upstream supported SoC really lacking a GCE register for the upstream
supported IPs?

I'm not sure.... :-)

P.S.: I guess that the alternative (that I somewhat dislike, and you can probably
       understand why after reading the reasons above) would be to turn that into a
       dev_info() instead...

P.P.S.: Having no GCE usually means that there's a performance issue! In that case,
         it's ... a mistake, so, an error, kind-of.... :-)

Cheers,
Angelo

> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index b0cd071c4719..2130ff3aac9e 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -55,7 +55,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
>   					       "mediatek,gce-client-reg",
>   					       3, idx, &spec);
>   	if (err < 0) {
> -		dev_err(dev,
> +		dev_dbg(dev,
>   			"error %d can't parse gce-client-reg property (%d)",
>   			err, idx);
>   
> 
> ---
> base-commit: 41913bcddc83b131649ee8ff0d9ff29e01731398
> change-id: 20240226-gce-client-reg-log-dbg-5ae9637a08ed
> 
> Best regards,



