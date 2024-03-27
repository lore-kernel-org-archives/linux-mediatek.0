Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF98EC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0RBjv/Mk5+1uH8zHWpw+frS6Pk+FGxJ0ixEJQeiLUE=; b=rn7afwStphNtwokBEXjdwk2H0b
	I66u1n4SrUNLybfkHIxyKQucYDCdlPfN5vwQkpgjZv9Nev8pmT0GEvoj7iHrftA0a5akPGDrlb6G+
	p5HlYbBIm2FBI63vM8LpCDGbL+aDtfYQYFjcSSueplTRUCf3/xs0wZ3PpyqeTRwBZ6+hOXLr8L6xK
	xGYoEUSsLwspb/5A83LDLYbh+7k6x/E6W0Cs/kQhr2AYaTKXMsOVLUx6QEpHVEWJ6/FDJcyhbwqnm
	or6wHqWIQcUPIwxqEj6gEAtGSc+Wx2B0B3c4Vt4eayu6DEKxUzqeblzsqWvFpj2B84O4a8p240cob
	0JsV7xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQei-00000008RO9-1Xjc;
	Wed, 27 Mar 2024 10:37:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQee-00000008RMf-3SgS
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 10:37:14 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so1174008a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711535830; x=1712140630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0RBjv/Mk5+1uH8zHWpw+frS6Pk+FGxJ0ixEJQeiLUE=;
        b=HetH/qqFKWNLDRAIOIXMhCNzCuYdb3NZseXwNlGGAWd53WHrilewt79KXhPoUdKbKL
         SQVt9SjtB0yPffGPqHtB750imHjE7axQCN0gmHZnO1PN0ItDkFWAeSVVIV6Nxno7ocTb
         pU7a1kRthOsrNplC+osW/w5G3RGmj7G9K53EwGwRziYdblYeToJpUInIqtBx/MrHxIg0
         KV/CoywY5eoBYpvoUP0Ki3qE8vTlEusdypq8CL72tc4d6TQyXmfMWsdw8WeaKb/ELlg8
         DxQChfWps9YCs243NWElEmJSpuNODa0+Q63hYZ2HXy99zXO4yYk6RVOloHUi7VzugNDP
         lRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535830; x=1712140630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0RBjv/Mk5+1uH8zHWpw+frS6Pk+FGxJ0ixEJQeiLUE=;
        b=AZJ8nGGofqBSOltr5YwznZJFKCQPHFsZC8+KG9wJxZPFP2YnPeg2iTkxr4VCXu9+YH
         YT6MsoVVjRK+OXFggYVDPNBrFuC8XHekWI7tQwfcNoFwBuGg6HwPjBYC4y+n/P/2AXB1
         LCocfvHYA12iwAEClMis6j7e4mqZdyv/PpL1f3kHnvEkL+CbPEnAi/5Ayi1o0gPa2fJf
         PLR2P6ASRK+QRVlv4xWhvtt3zGBCNIDnifdPubqfzXJNCrvJDy623p7WbNH2t1xnKIrN
         36AhuHf/Pt6Yc5QACOX6Cx7faWPBViPkcuNtpN7IaKxjWxrd/TcxQLaKReztuUtvRFoQ
         1kYw==
X-Forwarded-Encrypted: i=1; AJvYcCXMTwueiWtBTkhQzohurlHze7NMVpm8d3WVC4x+ihncEcpTrsuxhXlBQ0LjA9KaG5v1V5IbYi8PZ7/ZfW5TurMRfpQnMcnHmrfgfxKIPOruXQHJ
X-Gm-Message-State: AOJu0YwAxzarWN2NpJ+loDj0E1qqLxqrqdIQWVGpWavIW+Z2CJDQlmst
	M8QphT+skdHpwoW3To93q3yUxCawz5B216OjiDOkX7EkVhdXPuwkraVRNJ6AKtU=
X-Google-Smtp-Source: AGHT+IGz4Ddt/Fv3CJl38Ww58TnJzydiHKubdfPR7I7n1Y2mpYfMpwk6w9WcDu9linEDr2LcHQ+bmQ==
X-Received: by 2002:a17:906:4552:b0:a4e:ca2:f597 with SMTP id s18-20020a170906455200b00a4e0ca2f597mr141687ejq.30.1711535829275;
        Wed, 27 Mar 2024 03:37:09 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id d12-20020a50fe8c000000b0056a033fa007sm5109218edt.64.2024.03.27.03.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 03:37:08 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:37:07 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
Message-ID: <ZgP209t7IhdhcZIr@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
 <d213f262-ba0e-4cf8-af0e-66745ffea429@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d213f262-ba0e-4cf8-af0e-66745ffea429@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_033712_894090_4B231758 
X-CRM114-Status: GOOD (  14.88  )
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

On 24-03-27 10:23:51, Krzysztof Kozlowski wrote:
> On 26/03/2024 17:28, Abel Vesa wrote:
> > This RFC prepares for and adds support for 2 buses, which is supported
> > in HW starting with version 7. Until now, none of the currently
> > supported platforms in upstream have used the second bus. The X1E80100
> > platform, on the other hand, needs the second bus for the USB2.0 to work
> > as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
> > all found on the second bus.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v6:
> > - Changed the compatible to platform specific (X1E80100) along with the
> >   schema. Fixed the spmi buses unit addresses and added the empty ranges
> 
> Why resending after few days? And why without reviews?
> 

If you are referring to the initial v6 patchset, it was sent more than a
month ago.

https://lore.kernel.org/all/20240222-spmi-multi-master-support-v6-0-bc34ea9561da@linaro.org/

> Best regards,
> Krzysztof
> 

