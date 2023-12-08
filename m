Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246AFC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9ER5qIprpwLYgCbIQAvqPacoHFK4xi4mCA2pH+f0WM=; b=BZTetYVUQketdLuvxazPFxcEFT
	mex0KXurVPfdNuiiIMwh22d9NRkhMg1fvaYFRMo3xW9FaGp004g7UunmgvfvSXosV66NufaQu2HNf
	hj+YnlYH/qmweDUxxAHPxJoQEwnbm8ApdjxhiykAaln8wcCsgfCFcCxu7K76n7/hbiTjZ7zC9qeO4
	O3F1axbKt+I6ZV0pXuqljZ+JlNauLui6BcvygFW/ilKJJOpykXIJKOapqz74fnuYNTlpWj7Ew7nJ2
	4Ga5NrDOjFXdeXWtzAcPUFdWI7FdafEq7H7TYxrehgu+7MAaCqzhTousJMQ7bDkxBxDDZJwqdbMXX
	wT3/sGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdhP-00G1Mj-2f;
	Fri, 08 Dec 2023 16:27:35 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdhM-00G1Ld-2Z
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 16:27:33 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d9dbe224bbso1254753a34.2
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Dec 2023 08:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702052850; x=1702657650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9ER5qIprpwLYgCbIQAvqPacoHFK4xi4mCA2pH+f0WM=;
        b=Fn7yEXGOV3xtxxhkT3SVYEpNzqV2R01AtPXbwyeL90BBp3gRt1bvPSme50OdDwycty
         2X5VAxPDgm9BmYKb0z5MU6aGHo/H+eG6FDUWBdUwv7bJVmOxUfvGRoSQv2QX3cLhfzbC
         wgM3hkqsE53ntR63tNnp70nVJeVO5ME5R0F65k3bF54F8+KUtKaE87mYoyYX/MTMs4Dn
         RNgoGymSplL73YX2QAtgnj0CNfYS4ltT27tv08daSbHSBzuFI9mvqzsydHzrFF/QQILl
         ZrjTfHBIq5Ld7vBo16Uwek+o8G34IviJj/QPG4qSPjxcda3mNGu+/RHhuj2VP+SFRr1u
         TBCg==
X-Gm-Message-State: AOJu0Yw0tuwKmBLjL/7B67n7WUQKzkyKq35dwRXMD7F7tSQKBGZlTtPb
	T4X5WbKZPLw9aYMAppy8OA==
X-Google-Smtp-Source: AGHT+IGoCBIdUoYHkFT9QQgUxa2omYYXOQwXX4AzFygvyqUJIp41c4SIZsAORINlyDflchYMlvWtxg==
X-Received: by 2002:a9d:7758:0:b0:6d9:dd14:3a75 with SMTP id t24-20020a9d7758000000b006d9dd143a75mr304450otl.70.1702052850656;
        Fri, 08 Dec 2023 08:27:30 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e7-20020a0568301e4700b006d87df1c53dsm339278otj.65.2023.12.08.08.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:27:30 -0800 (PST)
Received: (nullmailer pid 1634379 invoked by uid 1000);
	Fri, 08 Dec 2023 16:27:29 -0000
Date: Fri, 8 Dec 2023 10:27:29 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: net: wireless: mt76: add interrupts
 description for MT7986
Message-ID: <20231208162729.GA1575094-robh@kernel.org>
References: <20231204091156.6535-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204091156.6535-1-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_082732_830796_C24ABEED 
X-CRM114-Status: GOOD (  11.04  )
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

On Mon, Dec 04, 2023 at 05:11:56PM +0800, Peter Chiu wrote:
> The mt7986 can support four interrupts to distribute the interrupts
> to different CPUs.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
> v2: Change to use description instead of using items.

Not what I said to do...

Let me spell it out:

  interrupts:
    minItems: 1
      items:
        - description: major interrupt for rings
        - description: addditional interrupt for ring 19
        - description: addditional interrupt for ring 4
        - description: addditional interrupt for ring 5

if:
  properties:
    compatible:
      contains:
        enum:
          - mediatek,mt7986-wmac
then:
  properties:
    interrupts:
      minItems: 4
else:
  properties:
    interrupts:
      maxItems: 1


If there are 4 interrupts then you should always have all 4. It's not 
some OS config. However, as an ABI, you might want to allow 1. If so, 
then the if/then should just have the 'maxItems: 1' restriction for the 
compatibles which only have 1 interrupt in the h/w.

Rob

