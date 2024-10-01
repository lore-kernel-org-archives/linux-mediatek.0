Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0B5CEB2E8
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 06:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+9r8/ELl7iDlCWa/yccfFSqcqOg6/F/KEEgCukawR0=; b=LdKFjiscLmO3XMFogoHw7oUWJ0
	1TPD4myynYVn7yxrX7F2UnRL4p3ws5JFlQNFI6MepbTW66AC5syhtJshI2R/+n3T987AV46Cs5RbQ
	QZ+nWaS0O/vfd4G5C+ktODl8qumEn2V7bAlIHN30NdAiGSzpzDjyMQVPlv0qbQIklmIdQMcm1aSaF
	zlFaNOQottHvLqe5o4HxbvTUVUxwjTSsakRm3Zw9BT0E0KZMuPKB5cM8t3ySVWNR25qpxrPjgWC5i
	oUZDDjCNpTw8IvnM3cCroonBqufj39jW2XCA6eK31QwirX/44rAHinC7VdbrEqRXSpjCenTgkavg6
	UBEdFs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWe4-00000001nwx-0b9T;
	Tue, 01 Oct 2024 06:46:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWbz-00000001nPU-28Zy
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 06:43:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso4444493a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Sep 2024 23:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727765034; x=1728369834; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+9r8/ELl7iDlCWa/yccfFSqcqOg6/F/KEEgCukawR0=;
        b=tVrUyFqH+AOhE7VpQFh92rcxSIBlGusmtJA6/b5mElEJ5eIOV2HHbygtie+qmssItU
         x+bV303NukuMjlg5O2xuvSvEc1VTEsgDd5Kzk9G7dFhTrTfNefy/LsijPRfUkRGS8yvY
         TTjlfjOqSXK3qYzddHvYOFG4valE5uLJzzMX3lFkcWLZOLmH3dteGEaBvrgNJoHBH7Eo
         H3yg/fnPvT+E0oyFRgOaAO31lzS21H3myoqgLsABP7e9Dmz+M0Wm2lITi5uE4+1osmDA
         4SlqIHWwIH55kpOlyNgZAMbIEqZocFtmgFdWXOTJAMgCR/9NdLmTlcz/k3Tgb3h8SCYu
         gctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727765034; x=1728369834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+9r8/ELl7iDlCWa/yccfFSqcqOg6/F/KEEgCukawR0=;
        b=bY9D4ujqXPy1YFTh9ftFcOpUtMhEjTBgO1DlMzfRyEQYmkbUTuct5Ax+GMlZjyibdW
         ROh3LRpKR6z8BrA3XnM3etxFUYELCM6SzeNX8IEE0O2CNLnM8/LemXsYtKuRPnMhFwoC
         iz7KTGPyaN9pBnhGso+iTdRBotBczVnYmvcuY6XJWVGTz4JgRFNv0Uh+rYz66P0xdDlk
         jHbpvwGsJWku7m13Hj3DF6FmJOGHZ/G5HptCuJ8N7dek7phlH8ww71GeSbbApfYo+0X2
         tdLe1iDRRDFu3vnCUNBUMOMzjluqwCw6ZkBcydCOP2WW71y1BRGJCY/3MucRpxEsWAYx
         6I5g==
X-Forwarded-Encrypted: i=1; AJvYcCXe/zSHeFouzYlpukFR3mUIHMxV0x5PqjSLyh7P4wfk5Wct58kED/zoNxDD6OvSxn0B4wVXxobxrN0tf4/72Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDSutRDZaQ04OyI+xBUQTm3IsxYDBeUJIglN48uMbKE7WEqjh
	JnINi301xl49HZYiBpEhjMDlwWCNg983CePSWFV9Sk6LXvbj+Jw6RgNd35c05QQ=
X-Google-Smtp-Source: AGHT+IGo9nDsPPgqeOWUQkdQH/9wmb+SBZj3pDfJ3l1Mq6Sz6MV6DgwxCFnauB+HR6NC6KCwCRh9/w==
X-Received: by 2002:a05:6a20:2584:b0:1ce:d403:612d with SMTP id adf61e73a8af0-1d52d10a3f4mr3324373637.13.1727765034276;
        Mon, 30 Sep 2024 23:43:54 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2963dasm7613444a12.2.2024.09.30.23.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:43:53 -0700 (PDT)
Date: Tue, 1 Oct 2024 12:13:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 2/2] cpufreq: mediatek: Fixed cpufreq has 2 policy
 will cause concurrency
Message-ID: <20241001064351.vpahvdwzmvjblnd7@vireshk-i7>
References: <20240913103933.30895-1-chun-jen.tseng@mediatek.com>
 <20240913103933.30895-3-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913103933.30895-3-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_234355_578809_635DF788 
X-CRM114-Status: GOOD (  14.10  )
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

On 13-09-24, 18:39, Mark Tseng wrote:
> mtk_cpufreq_set_target() is re-enter function but the mutex lock decalre
> in mtk_cpu_dvfs_info structure for each policy. It should change to
> global variable for critical session avoid policy get wrong OPP.

I am not sure I understood the problem well. Can you explain clearly
why the current locking doesn't work with details call chain ?

It is normally okay to have per-policy locks otherwise. Are there any
common resources being used between policies that need locking ?

> SoC with CCI architecture should set transition_delay to 10 ms
> because cpufreq need to call devfreq notifier in async mode. if delay
> less than 10ms may get wrong OPP-level in CCI driver.
> 
> Add CPUFREQ_ASYNC_NOTIFICATION flages for cpufreq policy because some of
> process will get CPU frequency by cpufreq sysfs node. It may get wrong
> frequency then call cpufreq_out_of_sync() to fixed frequency.

Don't do so much in a single commit. Separate commits for each logical
change so they can be reviewed well. Also don't send cpufreq along
with devfreq changes, unless they are dependent on each other.

-- 
viresh

