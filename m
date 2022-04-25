Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BE5C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpGfyKcRlrAXzV3nn/5xpaVdBsnizIBC79YD4rGl8H8=; b=HxqRAkd0Zz3Pf0
	9v++fvSHXj+7cqibxUZaWW8zxu0H2L2mEqUV1S7dmJwoVNc7EKwyxOite4TGtMR5OG58EJ9QaYLwT
	l+kTjcSn1CJDYxlrvV5BJ8v0+ubrsRjzmhm5Lwdo4laM2bLC84pMH5x/InIQXjHrLBEqJApEo/L6U
	j+rTJErykJ/f3JR6LBhXH5wR9UyW8vEsYf9pYTLYXekWr+HqAg5/VNfqUYeQ6rOjY8Dn5RnxEte6z
	AK7CXwJfg/IiLtXcaBIE3v2tAYLN8Eh3D/IpNUMBMjVpYW6i1Wtu6lSx+yIS2uRnnbhxmJ9hroRE8
	/CY9ioIEOFyAeCJWoY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nir1X-008Edp-L1; Mon, 25 Apr 2022 05:12:35 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nir1U-008Ec1-WF
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 05:12:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id z30so5859643pfw.6
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 22:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6+nWr4Y0lknbWn2i7wUGZGpJdQiqZVDrE2sy90jRX2k=;
 b=TXnE9l6fWX6RBgCxLzk7kJDu38m1Gt9aaNpsNNgU9ILQkJTaVwa+/01ZW5jCf/zhO1
 5kmzX/Q6sBx0Q85L0rbArtyCUpQRGsqYnBDPpn8xpYXs8th8ZSHpO63MnEjY/ds7MWaf
 QqnyzXzICuDDntnHLWdiYr58fUo5i7Cqgl6GY/xAqG2Sz568Q4KuEKSBEsbtg8qdaYEp
 Ry7cHmRM1GaUy97JxFeyxHG0s8Ur+1jj4hxVon48ACVFOixNnCHML76Sjn3z21lNnAV6
 IT7DRyM693oRuXOgQULXMJi+QFycj9ko6Hk86E8B4mUR2x9V95K++1qEpK81XfD1VD2I
 GRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6+nWr4Y0lknbWn2i7wUGZGpJdQiqZVDrE2sy90jRX2k=;
 b=zzHATFxQ3frr0SGl+pYyk5oanYjGEedktX9nkmpxpY6mMdeoKQLHrNb2eQZalPisC/
 K6sU2/Njy2HZPCWu+7tad0oE6iOWb0YS011kRFRuWupDg4pI3xuuX9t3KWe4sBnNfNGb
 V1bq1zQuCYVwcbXE+EDepz+tHv4YyYKcR88oiQ14L7Efc2GCVXXhRI37XBdLs+krjWnx
 Jf6I06GPBbjwqTqw+aPXsEhQQl3j/QT6HeZ5jPVrGU+ExIoeUYso4vgjUSkXAKanGQLU
 EJnoSrW5SciTYrtNo7grZcNVUgBa0+w4uka4PePR5JPjWxj/gmHK1Cf5+h8hMTnVg6/m
 7fHg==
X-Gm-Message-State: AOAM531oeh/S2wcqf1t+RzZAu8GvaQZsFG2B5KVCDVt9anuch2JjnZEX
 sJL76IiDELlc8omQPgxG/zGcBA==
X-Google-Smtp-Source: ABdhPJxoAdqqZYNLUfEPEATeFhzguNqLrENazm9zPZWZ0M/HzCefiyvBIFHsjvJu5u3knhJllQPxAw==
X-Received: by 2002:a63:5b53:0:b0:39c:c6b8:d53b with SMTP id
 l19-20020a635b53000000b0039cc6b8d53bmr13467754pgm.166.1650863552491; 
 Sun, 24 Apr 2022 22:12:32 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 j2-20020a17090ae60200b001d96bc27a57sm2575040pjy.54.2022.04.24.22.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 22:12:32 -0700 (PDT)
Date: Mon, 25 Apr 2022 10:42:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com,
 hsinyi@google.com, khilman@baylibre.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH V4 04/14] cpufreq: mediatek: Record previous target vproc
 value
Message-ID: <20220425051230.74gqbqgwi5afmyby@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-5-rex-bc.chen@mediatek.com>
 <f8f9bfa4-8591-0399-73a9-6e4b7261df07@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8f9bfa4-8591-0399-73a9-6e4b7261df07@collabora.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_221233_094119_DA23415F 
X-CRM114-Status: GOOD (  10.56  )
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

On 22-04-22, 10:21, AngeloGioacchino Del Regno wrote:
> Il 22/04/22 09:52, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > We found the buck voltage may not be exactly the same with what we set
> > because CPU may share the same buck with other module.
> > Therefore, we need to record the previous desired value instead of reading
> > it from regulators.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
