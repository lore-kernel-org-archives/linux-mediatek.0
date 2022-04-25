Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xf8tfpt9mFJXeBQBSmBQnRglpRaAArNXZic60n3CT68=; b=WAKrxHJ6g0vYus
	aWSmjJ+PGmiAb7yP8SYNfelBAPEF0qhcYINRZJz0V28Id/9sqNPeVFZBTiw112yTJ8TSkSqMLszF0
	hdfQ1CdlJH1dwKR4WzDmG/DGpdPeIBfMXQY7e1p+xpfArtGJ0clrEFEuFmMGWn04564QjZBYHGDNW
	P2tZio57IrPV5L9+OEUnYhgVFee7EKNo8k++prJEu5IO3AS1+nThHHc/LgoVuoUGIeMWzN1oYuRR7
	av7AQnP9sGB+4oC3emQ48Zh8HDLYQ4QlhvDriX7ZnYIyf8u99A9+R2Gp+GejUkBJgamrBD43krGqS
	FFdFrtoMIV3Qh2KHs+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nir05-008Dyo-7j; Mon, 25 Apr 2022 05:11:05 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niqzt-008DvT-UT
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 05:10:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id y14so13004888pfe.10
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 22:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=84kR6Ne3XN+sltkcwh/T1Tej1sQ2efwbcDr/K859dsI=;
 b=dN9wtsmeLae7F6wFK9gX7zDkbC7pO8fi49NOzAvN+FziFaQvJhVvGOXMvUzJ49ooDA
 IdHJ2hyB/xWo75MODlma39ciKNYlcH1DewSz/WIgv48sTW4Wjnm5ES4qowXDin+mSH8/
 guf0HP0LtYcsMkGJO5h8hWR5CtVhQQd93CZhutXYyOu+RFLzbuLgXS9fGM+Q33q3KocU
 EiGrkNh9QMKmERnZW9xog+piIG8uYQHpOTuQ6BvS+mUPbKFolqqGOga+USvw1wx4CQxq
 7IlNgYP4lNDmtkHO3PxzjdhdQb3i6r3qh8ng223W3HM3ullv5Cnc03p0QbyzgZmeKOm+
 SqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=84kR6Ne3XN+sltkcwh/T1Tej1sQ2efwbcDr/K859dsI=;
 b=xLZLaXE4xFxZtxiOc9NnE8btNaV4Pq/Iunst6wn+Qfi168vHZl+M2c0VMwJiFD0wbx
 d7E4tEoShRPy57scp/9JEherEfzIPfwcf2qGkznhd1IG45YRcr75XM021Ipx2LauSD1k
 RCzQPpxacYLfKGiVWs1wjWcYtUrGNXoriKDl3wjav4DzpsJob5YZbEdDElIfIlKGSYPB
 XoWHwNXNogtvUSOGfvT3ggGc2soKM5igrmpMHUEmaNkrfRZKLRLrmpDY/PFdPVHL8zXb
 Jb/vn1yGxGSmQ6QIkiwo1/2AhVpP4SIGkHCdHy2oUpZ5b5Evx8mj/9e76E9G2w2dOZ0U
 7aDA==
X-Gm-Message-State: AOAM530Dy/oCVIIb7u9gXOPxiEjvOUR+vJLTsrR3C84q3ZIIEY0zlwt9
 EreVOnxyYA5E0y8BE4R0fpfGYw==
X-Google-Smtp-Source: ABdhPJzGGW+GIrQOBy6BDvyB6yPlv6juol7Eg18fNiB0YyJ6APP5kw4YfaBWqD0Z9BK/KWxa2RwHqA==
X-Received: by 2002:a63:7d4a:0:b0:398:dad:6963 with SMTP id
 m10-20020a637d4a000000b003980dad6963mr13585899pgn.329.1650863452300; 
 Sun, 24 Apr 2022 22:10:52 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 f127-20020a62db85000000b0050d3dd1138csm2207570pfg.126.2022.04.24.22.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 22:10:51 -0700 (PDT)
Date: Mon, 25 Apr 2022 10:40:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 02/14] cpufreq: mediatek: Use device print to show logs
Message-ID: <20220425051050.6azd3izcuoa3ybj4@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422075239.16437-3-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_221054_005540_ECEE142A 
X-CRM114-Status: UNSURE (   9.14  )
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
> - Replace pr_* with dev_* to show logs.
> - Remove usage of __func__.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 54 ++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 26 deletions(-)

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
