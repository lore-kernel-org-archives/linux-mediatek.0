Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAABC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 04:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eNO9X4DJeWPbDizJY5zDsz9x26T+M5T+/3jW9A9mb8=; b=RcDrP89BebzmeZ
	Ict1tshjKYRufLVrBA33uIgYjjuKnizVlKkFwg+at5FAj3iQt2n6ZL6A9Ru/avxF7m0ciQoIzHxiK
	1DrRUgwR+ub1IpZf+yN+GxbEpFWYOuYeGlRE5A0SkTLuTtlDPHH8I0vGIDN8G1MMyiuM01ZLln9sL
	kYYQOfTkXuomZwCeOE9dsUTU+KBh6mOVf4RFTESR6QtIdV9jvOppsEME+WczTSAufWDPw+x+nn+Ep
	3D4tO0HXa0/ihvQUzOkjg+5NT73kYB4DcBJbMEEm5RUB9yG6l2zp7HSTiNs23v8hmjcTzTe/qF6Q+
	x/DuL73S24Dg4ViHqxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmpRp-001J6q-4L; Fri, 06 May 2022 04:20:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmpRm-001J6L-Mw
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 04:20:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id p6so5752596plr.12
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nYgHnNqlChNguPe7Q9G6D1OpvFbxYV1H4WdQcw7evEQ=;
 b=jLR8HEc8Nd75VZ5BMZ3GFNPR4EBWnhsK1Gi4HmhTScy0L2VXovvTvzt48ouC2ztuEV
 7UYwmbT6BD4//p9E+ex5zIrc17dCWgz3tLKNizpJe19Nz6F5XFBwK0tvGE26hUn8R0lK
 uX9vGEPo+nxqhfdwjJ+oa+wbNS2nQSwZfv1l6YfEnWpT+UosFMNdKC1IGwDveVzC2LDL
 rCt2EwbKegxPsGYnr0NycqAp2AQfRjSzGLLCun1sLFgq575fPTYXe1nchL45VMOOrirL
 QStI9DRPJ5ceSGkX+OI571GoMhgA1rcltzY2JMyysNZPiYWzUqD/7/OKTAp17VsyxVk4
 8G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nYgHnNqlChNguPe7Q9G6D1OpvFbxYV1H4WdQcw7evEQ=;
 b=aF/z8vZV0p0ZiHObjKO2f7qqJjeMal7xewQ7R8MZH+PSn7kOgcaMzFOIImbjiSQxVU
 +ObJID5x8z4GwTJQcIdU+hcCrWPjEbY+wXeLDP2764gi2N9e3bNd9JQJsZQdusf0Zz58
 km3F2TeQPFAlauyEOWSCUoxF4ZnTBwRUnK0bdoX9bAUEPP+0E3q/hN/633RC2kKSBH5o
 HFg+FIUwF1sxalvB5+WpL/5zNgyeeVylTq0xxpQLWYTE8cHB1PNnQ4s2qPlSKOTw38K+
 4VeA5irZLHnZ3JxddgrQUB6FeDFga9rmscfKwGU37zHAVbkBniOLKN4dqKgja6UL+ily
 /N2Q==
X-Gm-Message-State: AOAM533jzCSqwYBvRHDIa7jKRUdUezeZMvY7iaVlxhbEC6F2CL2/wWMh
 xw5ZAtzRHbfpU+x1OJo3VR6jrA==
X-Google-Smtp-Source: ABdhPJwPdeAVQ0kgtN+QPRoWNHRxFzCt8kSKOwhyA+hqhpV5DQjikmiK5c4CLYCslM6zf1SeGOCrug==
X-Received: by 2002:a17:90a:9483:b0:1dc:5fb2:9b89 with SMTP id
 s3-20020a17090a948300b001dc5fb29b89mr9937153pjo.235.1651810806236; 
 Thu, 05 May 2022 21:20:06 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 z189-20020a6365c6000000b003c14af50620sm2156741pgb.56.2022.05.05.21.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 21:20:05 -0700 (PDT)
Date: Fri, 6 May 2022 09:50:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 00/10] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
Message-ID: <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_212006_838294_65C3BACA 
X-CRM114-Status: UNSURE (   9.90  )
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

On 05-05-22, 19:52, Rex-BC Chen wrote:
> Cpufreq is a DVFS driver used for power saving to scale the clock frequency
> and supply the voltage for CPUs. This series do some cleanup for MediaTek
> cpufreq drivers and add support for MediaTek SVS[2] and MediaTek CCI
> devfreq[3] which are supported in MT8183 and MT8186.

Applied 2-5, rest of them depend on the binding and dts patches to be
Acked.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
