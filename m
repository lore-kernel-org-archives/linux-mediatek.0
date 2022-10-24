Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85D6C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWGGk3FSvDrDNlj7m3/+RkyTCBK7scHSBvuDcHj894A=; b=B7wjU+D3ji/Yqr5WiZOJbHnD/e
	D51+z+SBOmWlAu3Otx7FLzPsBm8yaIE4zx7Ttv8MbnGRm0i1V2h0MN0ByHi7UC1GVAj0uQMKyAYOb
	VFxWDPE1OBW16k5fRi5wYX4SnlgtN5z/5uvQZ44DrpcZBIKFmXHYlqOVQRBtjluuaSTKdNvBMxXii
	8lwXx+WPsAsKlZ+POI+vXwNqCsgqmyfPo236oHl2cPVEN74Q5zQfWOjW3H7UZgYdCmUII36vHLWnn
	ojoZ3WNm8yklDVSBsuEveVugGEW5Evrqdn0EhcSEechdSDUFG0BHRlpFcjSOdUr9C8x75yFqG/LLC
	Ov3BLEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on30r-002lNO-BU; Mon, 24 Oct 2022 19:21:29 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on30g-002lKh-Pv; Mon, 24 Oct 2022 19:21:19 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13b6336a1acso7487659fac.3;
        Mon, 24 Oct 2022 12:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWGGk3FSvDrDNlj7m3/+RkyTCBK7scHSBvuDcHj894A=;
        b=HjJMKq00fjy2fl13pf3AswFeqYClYz4p+xpN/uyRDjJ7xBJDnv3xLhOZZ2JuMFcBLs
         +eeuxk2vhHc9kJilPHTkvuu64wyf94i/XNwE4UAx0kSBDxg77nSORp7qfvO/SOVsCPve
         btWn7ONpgGpvJal/CWPxMMwF4mLkcs0KPucVMpF4XzExWZq5cjfm/WNR4KXyV5GsCiN4
         E8TlO7WQunKly7gn1SRomQrP/jifVF6MMddwQ7MTmiGPWMBLDSbHNfcIJJJIGfXPV9Zg
         ZrV+T16Co0j5JEQOndcw/NJnjal94vb8Pmx58bc3DDsM9cqigiiJGvKxyQyj8lnRL39O
         p90A==
X-Gm-Message-State: ACrzQf2M8VFQvDdhkv8o+KfROF/LDJx9XXTEac2guYmLNOcqoKtgyEsZ
	sQRDjM38PyGG9wodOr0pXg==
X-Google-Smtp-Source: AMsMyM7Kon71TlhiViOgQoNGKfyW7PqeyYXqSISfxJSgf75N31P+dvtYVbGx3ovjnog4dpNSMlMyYA==
X-Received: by 2002:a05:6870:f692:b0:13a:f2be:7b49 with SMTP id el18-20020a056870f69200b0013af2be7b49mr15736513oab.77.1666639275109;
        Mon, 24 Oct 2022 12:21:15 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r40-20020a05683044a800b0066194e0e1casm102893otv.75.2022.10.24.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 12:21:14 -0700 (PDT)
Received: (nullmailer pid 2069404 invoked by uid 1000);
	Mon, 24 Oct 2022 19:21:15 -0000
Date: Mon, 24 Oct 2022 14:21:15 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: mediatek-gen3: add SoC based clock
 config
Message-ID: <166663927468.2069331.7937155894835281223.robh@kernel.org>
References: <20221023170234.83621-1-linux@fw-web.de>
 <20221023170234.83621-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221023170234.83621-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_122118_858560_9F317A47 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 23 Oct 2022 19:02:32 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> The PCIe driver covers different SOC which needing different clock
> configs. Define them based on compatible.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 48 ++++++++++++++-----
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

