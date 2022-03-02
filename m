Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 23:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrC2CIrbEzJnwZ9jY3iGeJUYa6j9mZTwe7O+KmgFZdQ=; b=LIKtTZgSI34CwJ
	bsC+ob810NXv2KTdAHs8yN1ySvJ9zjZIF7NBiqUQSbdjMg7gYcxS+W6uc+UDJ44j46XyGvKv0R2iz
	OmxNdobPGFHX+fud1vAg0z7DUpEmf9spg0pdjQbqp4fgTavpi3jVOhYp304eeRD2aZe9P3JqBxZ6E
	Bo5gAW/+MtkFspWVzxN/+I0/gttU3z4tJ0Tu+4Opdu9/HEUzNRzfJLrfVPqlEd3AvR0QvWquH2vOo
	m735u/NMg7GCv5jVLqhWqJfDwB8o8DwfkG2tlRHxE4XIFr2r6/NPdWSbORD97kAo3EmJm0qeXNvx0
	7KhbxCwsN8vecNhRJIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPYi8-004mNk-9q; Wed, 02 Mar 2022 23:48:48 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPYev-004lLG-Kq; Wed, 02 Mar 2022 23:45:31 +0000
Received: by mail-oi1-f171.google.com with SMTP id z7so3301395oid.4;
 Wed, 02 Mar 2022 15:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TVwAiWa85hMzvOKS5YqVsqzuP2wtpcfL3Lp/rwM7cLo=;
 b=xnVi7Ep7yvr0iek5tnUfV9MvN7GNBMH4ET40nMBxfpJj+7jVwS3wXJgswpDTzqrxo/
 fWs66Ipk8jF891IdFKxA3GN0wXGuuqHFt+CZ0dugnTqNN6N9ngYwKPBy137g/JzbzX6s
 oWlKsgr5Nhj4ZraSCdqKESFPzpQc2G3bNJstdNVubT3YdG2aevPE3/+O+aHX6l6wB7H3
 fHfNOR2mT9BZtUvK/IRymK1cLH8Rl1/tKF6ujcTIbM2coqoFFzP+8oyEtdbTUcSq2oMn
 1BOOIMnUle/sqsO6Ne8lPvkoFa9ZOjWWo6NG7x/858ejn62IaVATMnjdk4RKqn+2MRuf
 xvqQ==
X-Gm-Message-State: AOAM532Zc7MF1/+EHGaNv6DGDTYHoS1hvU92MF+t/MYKzv+Mk63UCivO
 IPP6ZMRXN6SXAkQzRpX2cA==
X-Google-Smtp-Source: ABdhPJxe/GLJSdnuwSrDlaLTvAy6qRBAvzK/N3ff9doZ/bxjytEkDVKgKi94KuMwdbOu6KjZ1it+Lw==
X-Received: by 2002:a05:6808:bd2:b0:2d7:9ab4:a0a9 with SMTP id
 o18-20020a0568080bd200b002d79ab4a0a9mr2128835oik.81.1646264728524; 
 Wed, 02 Mar 2022 15:45:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056830200700b005a09222e268sm203009otp.7.2022.03.02.15.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 15:45:27 -0800 (PST)
Received: (nullmailer pid 281569 invoked by uid 1000);
 Wed, 02 Mar 2022 23:45:26 -0000
Date: Wed, 2 Mar 2022 17:45:26 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, yongqiang.niu@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, jassisinghbrar@gmail.com
Subject: Re: [PATCH 2/2] dt-bindings: gce: add gce header file for mt8186
Message-ID: <YiABlmL55ZJBOPUz@robh.at.kernel.org>
References: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
 <20220223030138.13939-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223030138.13939-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_154529_730937_BE664F8C 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, 23 Feb 2022 11:01:38 +0800, Rex-BC Chen wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Add gce header file to define the gce subsys id, hardware event id and
> constant for mt8186.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  include/dt-bindings/gce/mt8186-gce.h | 421 +++++++++++++++++++++++++++
>  1 file changed, 421 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mt8186-gce.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
