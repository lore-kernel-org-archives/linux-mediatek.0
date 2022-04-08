Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ZlwCv7+9dBmRms3WiukYgaV9YbnsKNeawJdoBgpPjo=; b=XsoZb6bC9JeZli
	mKS0W3TFtmPXcnIdQ1+k4TijFC3tAyhtXxLO7CaT/N0Le1aWWS35GqoU6gRQRZ7L9k6nSJgWyNFFy
	T8s/DWe0UZK2THHM0mb98Vk97HdOt1yXb/0m0SfnNux7Bl1pPRxVeAkDoC46U848l2MWfRByQdBd5
	NhgrUxKMls00MXlwHXrGF3FHR7VLjYS2fatYQqyguQA1epjxDpCjdoUkaraKcLckeadeDOff91eap
	IJDRdAqQVEuDUSvH9tvdMbsfxnRTNVmBlDsAQyZTyeXNOt2DyjiMYN01/ZM4NxNs0z9Fii/MSVniP
	fhpvvcPZfqNAeuZCtyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncvtP-001Gk0-Aq; Fri, 08 Apr 2022 21:11:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncvtD-001GeB-NA
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 21:11:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id s8so9424032pfk.12
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=yJoHVgCYASD8LnGD6yxNNYWY7QMbfJ8fAJgs8FOfIBo=;
 b=PPblHVCYNoTcYVGEDB9f3y8lb6kGlK/DpqflWVJ48wuqmbEKlX2Am4/NlbakXY8uK+
 yyv8n3dHilgLjLb/sdCT3X4JJW7BI9ZFFJUfwjVLdZozHe+ZlbNR+pgWNf1nmzPQ0iDM
 euXaJWoaJfy7oqug4JTuNadUjl3uBhsQwIlkwp9tRv71F9NHh5qbOn8ecKngNrh4k/cP
 8osiIySWZ7z/RFLqEFdUQxS5j9ehgEoZEOiViRACJUDNZWaMZB2/1E/EXGHLValnxRtb
 j9nA+i/kOfJTxme/3eo7B+pinZ0T5nwBfOD6ubx2YL4L0qZaTRlh7McDg+y50L5+d4ea
 jQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yJoHVgCYASD8LnGD6yxNNYWY7QMbfJ8fAJgs8FOfIBo=;
 b=MpoRLUElBRVlFgmkX9G1I0Zot+ZkAO2IsW8zZ8xbGQT+fUdwU27JPHlp5x06aaXkqa
 4OC9sRDdV3WBUTySgI5qLF9g1ayYyifQ3GTlfv6BAwUMjg7MFnLlACV5cvtV15CgSCEC
 CFAhEApomJ0RE70qQlPU9foyNN3e2mgqQ1xzk40p8FJT3SC+yffx1Q197auV43GMuYC2
 gt4N3Vdp59LT/1oZzYdyYfuWqn5pIDTz/2Ayy/E7R6lqw0O3F2EIaGT8/6+JsTs052+E
 ktAnX3GHHMKN6XkAFr8w31QyF2xndwwvKsfReSLweGMgAGosHKOPp3i/m7VzEmxhHiVA
 VufA==
X-Gm-Message-State: AOAM533KHJBWE3JX3xo2v+EtVG9kM1APufSKDSSNF4VmIiToDt8KtXKg
 SjMnNCGy9khtWg9w1mzdnPWP5g==
X-Google-Smtp-Source: ABdhPJwz6J42A+7QBRIWB9Mr2szuhxRCqq/9FHbuGOK9KLJKIYDpU9wSFNCxsthrDdcpshIsu1yBbA==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr21713713pfm.3.1649452288648; 
 Fri, 08 Apr 2022 14:11:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm26668230pfu.150.2022.04.08.14.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:11:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V2 00/15] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
Date: Fri, 08 Apr 2022 14:11:27 -0700
Message-ID: <7h5ynj5lhc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_141131_782167_C0E28CDD 
X-CRM114-Status: UNSURE (   8.66  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> Cpufreq is a DVFS driver used for power saving to scale the clock frequency
> and supply the voltage for CPUs. This series do some cleanup for MediaTek
> cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
> devfreq[3] which are supported in MT8183 and MT8186.

There's no upstream DT for MT8186 and there are no OPPs defined in the
upstream DT for MT8183.

In order to test this on mainline, could you provide a patch for MT8183
that adds OPPs to the DT so this can be tested with mainline?

Thanks,

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
