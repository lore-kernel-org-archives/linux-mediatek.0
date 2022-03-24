Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGLUCT2loDxsneqiiZgFzxSlv0ueaNnd9BJYtC+/HkM=; b=Rx5XCAi/CCyu/U
	OEq5bBGhX4RntYoCJlL/6aKzK+887ihaox753mykz642hz1s6Fy58Pbx34q80Ha8+poQ/U8Ie1PeL
	Ztm2LYWvsGv0booaLiu9WqGkqPakAw+RT+KDb2wH7MhPB48PsDiQpZhQ7k5VuYZdsN3kt61OnImcp
	aAGe4SFG1XS0cvjfk8L6c/vP/VtonH9cxutABKEYDnAtaeiPzBJuyp7mKvWUCSEsaMTjwkL44W8ia
	bXiBQI6soaNZS1rABhTywu2jKTSrbVQj5bDqA+KmLw8ItHdqMWK/KzVmfUmzlGtQjqNYiNgm+9vO8
	p+C2bvXFjuRL+uM5KR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXUcA-000DQI-QU; Thu, 24 Mar 2022 21:03:26 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXUc8-000DPE-Cf; Thu, 24 Mar 2022 21:03:25 +0000
Received: by mail-oi1-f172.google.com with SMTP id t21so1295787oie.11;
 Thu, 24 Mar 2022 14:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q25spFCj2OPBzQfCV+Da/CWuMLQodxbTw+TkS6+i2hU=;
 b=4qEmyUkVO9kRLttMp4LS3yQvAIZafjGZNbvbrui/jZvpOukhyH434BDDDVxnI0BzBw
 ElPa8sbqlADvOmAQmvDLHPOsMgRDU1d3Ho7hzWE+ril54/f2x3IfnLGJ89pKpsBqrEzq
 TLPeGyS0HW8ITX+EleWQKW8k0QULznytjiJV+oUP8oxaRNjkNM+5OTuNjym05c4Pkrob
 O3blS5jVtz7BvPpJdB3ANo2gvk49+QhkqtUEIUgXoagtezrlj4cM0EY/QL333YiXL/sT
 9HdTESBF8QnSu/lVpVvRUKVE5R+7oZgCtQO3XqLkPlTBLDYvvbLe4oNByli0OWqXeTqg
 27rQ==
X-Gm-Message-State: AOAM531v4WGVLbXYQZLL5pacynue4RrWpquRYpCz9lgAuIorEALRRomp
 +xTK6yIIKA7qnun+LgGLNA==
X-Google-Smtp-Source: ABdhPJzu1o2h/08FinAKWrwc0wvgq1Sj7A0Omdxcxve8G62Ja8afHn/d/gmFouU1Wtr1FSpHVCH5Pg==
X-Received: by 2002:a05:6808:1a9b:b0:2ec:9c38:185 with SMTP id
 bm27-20020a0568081a9b00b002ec9c380185mr8323647oib.165.1648155802614; 
 Thu, 24 Mar 2022 14:03:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 2-20020a056870124200b000dd9ac0d61esm1812407oao.24.2022.03.24.14.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 14:03:21 -0700 (PDT)
Received: (nullmailer pid 2568899 invoked by uid 1000);
 Thu, 24 Mar 2022 21:03:20 -0000
Date: Thu, 24 Mar 2022 16:03:20 -0500
From: Rob Herring <robh@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: Fix refcount leak in
 mtk_pcie_subsys_powerup
Message-ID: <YjzcmAgS7twWntMf@robh.at.kernel.org>
References: <20220309091953.5630-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309091953.5630-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_140324_459108_6B8BB63F 
X-CRM114-Status: GOOD (  11.96  )
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

On Wed, Mar 09, 2022 at 09:19:52AM +0000, Miaoqian Lin wrote:
> The of_find_compatible_node() function returns a node pointer with
> refcount incremented, We should use of_node_put() on it when done
> Add the missing of_node_put() to release the refcount.
> 
> Fixes: 87e8657ba99c ("PCI: mediatek: Add new method to get shared pcie-cfg base address")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
