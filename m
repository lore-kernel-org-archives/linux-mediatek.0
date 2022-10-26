Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2892ECDFA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqqsaf5zbzWRtIRRFqnKDgNzNJYpjNhboLksCWq9nmo=; b=Kx2VB86HPFAdFcnHhlFU7e6oBY
	Tv+blprCP4ET6QnMy+rqP+2FV56P6ITNOvVLx7P+SC7pzef6WeSrQRPsd498r0L5HFo8OKgPDHUFT
	UgtU+tgLcvprZFDThLcyxiU625scuRi8RALSSkI3OMen7qYEiDg5fn0qp5D8mCeqoyis2xirVcuTc
	dlceLZPQxWSv5jf2YjZaDfa70cuuHePC/oEIDETC0GscJFPVk3HoBahmEHiE/aPRY5RtetitTFfI6
	s1pCU506VuGjNaM/khlRbQ/tDGj/ZB5ME+01FtSBh6uJYhoQ8xD3WpQ3TAbk0zIOGvPQA9JMDb1G0
	s8kTExlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmNR-00Ar8L-Ab; Wed, 26 Oct 2022 19:47:49 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmMJ-00AqWY-Dv; Wed, 26 Oct 2022 19:46:40 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13ae8117023so21606091fac.9;
        Wed, 26 Oct 2022 12:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqqsaf5zbzWRtIRRFqnKDgNzNJYpjNhboLksCWq9nmo=;
        b=JG/0/6042vEJfo01Bn0obkCVa3DB4ayIwf8Xck/ZyIVJNIv7oRY5CGjndlz0xnTnRN
         R+becoJh0ZujyWLuMzAt9nSBlWimyAYAA0fRdd5rn4G3Xv0TZzfzXpkDVUXTFf8Ot2Km
         9/cUsdIZ+H8/Vxmvkf7l+8qEHVEaMxURsqpIbWlU7Hg6imXJxi8kFxqQGBLdGA1uM4pc
         kDCWULDpotB1t18EsudNXUf9MMwf/nAm0LFG8JyvoTZfTEpz5JekwF4cWIlYJgK3XGFE
         jVFWEUv+1IsOpDuqH4Ec315AlavahlFTb2ScluPpp7frdxtvgM3xzJlM/e8N4UAkBdhM
         OsEQ==
X-Gm-Message-State: ACrzQf0iOubSYCbPg0uSh9eq63ZpgsP4z/OQLJyhMQClzBd/8JTX7qN1
	rBsJ4SQxUZNh++w783hWJw==
X-Google-Smtp-Source: AMsMyM7qrlWNfGN/uF7X0V0dVQU44KC0a4x2WHEmi4Fj1+Qs4NthJn5IbwHLNUx5D6pmFLMpx3v7Pg==
X-Received: by 2002:a05:6870:56a1:b0:13b:c1b:3908 with SMTP id p33-20020a05687056a100b0013b0c1b3908mr3276113oao.208.1666813596356;
        Wed, 26 Oct 2022 12:46:36 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x10-20020a4ae78a000000b00494ed04f500sm531228oov.27.2022.10.26.12.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 12:46:35 -0700 (PDT)
Received: (nullmailer pid 1053030 invoked by uid 1000);
	Wed, 26 Oct 2022 19:46:37 -0000
Date: Wed, 26 Oct 2022 14:46:37 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Message-ID: <166681359601.1052963.122005161549178587.robh@kernel.org>
References: <20221025072837.16591-1-linux@fw-web.de>
 <20221025072837.16591-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025072837.16591-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_124639_500004_1831D92C 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 25 Oct 2022 09:28:37 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string and clock-definition for mt7986. It needs 4 clocks
> for PCIe, define them in binding.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - squashed patch 2+3 (compatible and clock definition)
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

