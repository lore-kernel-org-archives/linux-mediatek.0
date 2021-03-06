Return-Path: <SRS0=D+wH=IE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999EEC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 20:10:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4DCE650A5
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Mar 2021 20:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4DCE650A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=imFcWDioZy3AbV3oTNlNZy0bXPQ4ue1SrBIsje9s/zo=; b=OEkvtUXHKgELW3ldXUTN00Z6G
	CaD19reOmZQVfSj/xb8gALjnSq7uP4FmHlkPhrh8SaV4/aDAmqXmYCa+nCFGs/7D6C5X5i9CnoUmE
	242Gm/HMEFZuI67/80OngTt/asuu7G6YxrTti6mk9//4DTCI7AP8vLrDwEIrOhcwR0w2Ng36mJYfP
	uhT4TAVbzpA3aM7shMPAPJpf1GCIFZNDhRyn5XMiAyWP5QFW0riSLs6fPQqfBKjht4ytTzNPB3IlC
	w02h5eW+JuV4ffamqiqsxbyHTtZY+bHUV9VQlUXVrZNL/UFYpqFdGJPx8GuACWV1Pov1vHkMNsuNG
	PfSdtslfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIdFd-004cAP-BE; Sat, 06 Mar 2021 20:10:13 +0000
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIdFW-004c7b-J5; Sat, 06 Mar 2021 20:10:09 +0000
Received: by mail-pg1-f175.google.com with SMTP id a4so3719732pgc.11;
 Sat, 06 Mar 2021 12:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y0NmWmr7+4hpuoemyFwvJHGOeoSS8zaaxD5X6QfXCJc=;
 b=ktMRdXcS7RpYen8nolc3AF1/nXKkA9ZeWLyz9nzF2CkWkHfMXcQVo8bqS0R9sey+nd
 i1RuEaRHgB2qeXtMBtwSaPd3AeuzMOG/DUQtkI6WXv/gZPhPw+pXIr9WSYidVL0MeE5M
 jCVYTpruWDmOsb1QUDflgUajUKH7ou/14rLyuX6qwPwrCLjIgW+gR+rI9HAz4N4bsDC/
 LZ4nvVtc9fh7ASsosuprB+7EcXbft2jo6S0KeVNvZioCpZjbndJp8I0qVwkOQMg+Pht+
 IteGgxIPCFwifwTOR8bR1/ufKYQu0zvGFv1BPnbpwmO3//l3f6+5SyRfK8e2MN8IMj9j
 yxeg==
X-Gm-Message-State: AOAM5325ms99qKM7lAH4BNJJsFmSACr50ey4DZzTvbJPgoAZL4JITGSY
 q/XOd4fYbe500Op7cA3GvQ==
X-Google-Smtp-Source: ABdhPJwiuJ3EVFjA825MHShdsn4N/3ANb/rRFBPZlrtTeb4DG2Jh3WifNEVmvwdFzrMMQEKlpKHupA==
X-Received: by 2002:a62:e809:0:b029:1ed:c7ec:179b with SMTP id
 c9-20020a62e8090000b02901edc7ec179bmr14276589pfi.43.1615061405061; 
 Sat, 06 Mar 2021 12:10:05 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id p26sm5933909pfn.127.2021.03.06.12.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 12:10:04 -0800 (PST)
Received: (nullmailer pid 1137739 invoked by uid 1000);
 Sat, 06 Mar 2021 20:09:58 -0000
Date: Sat, 6 Mar 2021 13:09:58 -0700
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-pci@vger.kernel.org, youlin.pei@mediatek.com, anson.chuang@mediatek.com,
 Philipp Zabel <p.zabel@pengutronix.de>, maz@kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, chuanjia.liu@mediatek.com,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Rex-BC.Chen@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sj Huang <sj.huang@mediatek.com>, sin_jieyang@mediatek.com,
 drinkcat@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, qizhong.cheng@mediatek.com
Subject: Re: [v8,1/7] dt-bindings: PCI: mediatek-gen3: Add YAML schema
Message-ID: <20210306200958.GA1137684@robh.at.kernel.org>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_201007_345350_B6450F87 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, 24 Feb 2021 14:11:26 +0800, Jianjun Wang wrote:
> Add YAML schemas documentation for Gen3 PCIe controller on
> MediaTek SoCs.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 181 ++++++++++++++++++
>  1 file changed, 181 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
