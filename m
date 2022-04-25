Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98178C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHkgReiNoTiRRqxq3euKG0nwC+Vbq+XzGgN6EN9aQhc=; b=O0xEbRAHTP6UQi
	Rsb+VxOlv0dShuueqB310truENKW3Ihlfx9Ixt0jnVV4j+d4GW6WQTaBvJzsnOq1Cv4YbVzoSOybh
	xos9gTwSYn1i0b3iRWh4bf7R8UOivFxS2vhYJqyN5+GcKTh2zck7KQX1htdNTSg+cLZBRELlymR79
	cJWozYEPGjVqWMzVDf5jVTBZueGm4ln/5leb6KkTcNFbUMxACmvRmxJiIAkDSXlpSiF1PfwuRLc1y
	igdoRQBIuYSreMN2jqrAzGLuLe3l6ZVXkQuGWb0Twl+RHJlZtUM+5hT/LSAQIdlhkN/07QWNLxS1D
	gq3kCdI6/lk9qRgtgl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nir0h-008EDg-07; Mon, 25 Apr 2022 05:11:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nir0T-008E86-4N
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 05:11:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id h12so20761774plf.12
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 22:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZvxV9ZnERABhl2EIWB3iaKqhZLjFPNeceIsyVrSRWvs=;
 b=MOb+NOSkcuxT3iC2OB4nNFe+rcsvXi1TPBgskPY2Z1FrXEtiVy0Ae9bKmiSUyhlwFZ
 MKnxDTN8lUxZ0Xnn7sl6JIfqOunMo/O2GdxNQn/yEHo8LJ9w2ViWjmBYj1lUkAbPoWj3
 msXeQ6FbQQu/UCEM5kNMLKIjlvMFAY4dJxzA5fRdTJPo6KJlxN744Uted6jPb9BON+19
 JDw5C4GZrMpSYIOxY1D/yKT/4IL4o3YC/jSc6lgC6TS/IImuYnrXT94nFVunT8RBCM9Q
 tumG4gZfNJSAYacyc6P1SwAlsQZob2Zvop5Z64UFacg+iYaghM/f2HeyDLK4amlAIUUi
 kJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZvxV9ZnERABhl2EIWB3iaKqhZLjFPNeceIsyVrSRWvs=;
 b=bwyU6VVT5eIU3nNwbBWtHnOThsg2OmiZ8Exh4Ehex+/wdfi6z/KkVBDabs5whFU2Dd
 312OmHiARnj8Ulj0zUNhWIfiMPkpwAAR76j1gT9uf43hdlyUAJZXOcjW5KZeDcNI3oR9
 VIkwLRS+8bdv1+a7bnZHUB325+MC2TthDxOCCrloKxFug9CABnNqPdizN9Um4ums1q3G
 YnazNVv+EfLhnjMv5/Wf+seqNIHPToU3jKy3Mgo0dSDnkEqf89ZHEl/xdk1ZVcFMkegM
 vlibB/stBvQHCxIUP76PJLpV754DfH0Baad46WMVu3Jv+GsevKTyWS7iyEQURpbf8ak8
 t5yQ==
X-Gm-Message-State: AOAM532tPv/xKnzFa04HIHJ2AG7ZiFewHiY0ybPcHcsHU3nzrMRoIxPr
 nRJNHP4Zif7U06O2HJv4/nY6Aw==
X-Google-Smtp-Source: ABdhPJyMuAnIZMhsEBRUbqrq8jrM/dXAU1QVX+cJ7FJJI9aelTLzI6ZCuHEkflMcb/yh3jFoW48t3g==
X-Received: by 2002:a17:90a:4a8a:b0:1d5:a3df:ab5 with SMTP id
 f10-20020a17090a4a8a00b001d5a3df0ab5mr23699773pjh.64.1650863487809; 
 Sun, 24 Apr 2022 22:11:27 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 n64-20020a622743000000b0050acf41bde9sm9778362pfn.117.2022.04.24.22.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 22:11:27 -0700 (PDT)
Date: Mon, 25 Apr 2022 10:41:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 03/14] cpufreq: mediatek: Replace old_* with pre_*
Message-ID: <20220425051125.r6k55uqnkgnpm2sm@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422075239.16437-4-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_221129_199896_8970487E 
X-CRM114-Status: UNSURE (   8.45  )
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

On 22-04-22, 15:52, Rex-BC Chen wrote:
> To make driver more readable, replace old_* with pre_*.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 84 +++++++++++++++---------------
>  1 file changed, 42 insertions(+), 42 deletions(-)

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
