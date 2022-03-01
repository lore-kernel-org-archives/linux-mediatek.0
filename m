Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F38C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIQ+POVGmR5+Ci0Zy/jpOUzaAJdMuiGH3grbhZf7z5I=; b=BFJbEbZXtD34s/
	L6pSn1Gy+SnRhalc/p99rSBrye2IIx1sDP0wmK5aUEdJJeYTLl9N0ADin2kpEOh1peG9GtzNPs3+F
	x43Qmbekr8f/S8WzM+7+lGUwtYah8YBT/KrG3spGUbKpsSaLYm9RVM00FTN9EZcFqknHkFQHo7rR9
	o+s05TsGPaFCQ4yqzTtElzjw7Znoy7190mr6giPmVBXSUpmXdFxDwTExqYQq+F9wp3nYPOVno7o6E
	rExPg2sy9Vjuvl2cl0W8TpfcmIvd5NlJahqgwuXQ1eRaxKg4lFv+HpsYnmM5Nvi90Ttn4n6FZzRGg
	XdRKcTymcwjr9yYLdliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxxb-00Fbhg-AF; Tue, 01 Mar 2022 08:34:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxxB-00FbUy-Cw; Tue, 01 Mar 2022 08:33:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id v21so19186976wrv.5;
 Tue, 01 Mar 2022 00:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FrB0xiqh0R3+CodGDBFzoTSka3oB+8cQkeH+HR2pscY=;
 b=ZItHWuNisDbCn4VCnfN3PKVkjPdVF+MoXs5DozzoMvhf0aBhvosMiy0km1eXBhToT1
 /gqZUncEzz3+2DTwVKa0q/mmyxYDKZe6vXnFF3nsKB3kiCVqr+rosbRkcwwYFHh3M3ZO
 HX/Z4f94DWdBgpEK2BmHXDdDTXZtOgMKyaoY12Wss61GWovvyVUOZ8si/c13Fw37Exrm
 nTxnJ6Z8+a0eDuu6M9aoBhw8xwlFhVco65Rr3XzWuIS8ScASDU9FRtNMmbwH/e6+zFK5
 poNZRAsJfWPm046gB+BIDgJ939FLnBgl5lQ7R5A2qJMxs4IITyMfMHKYukPlWKC2yVSO
 bkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FrB0xiqh0R3+CodGDBFzoTSka3oB+8cQkeH+HR2pscY=;
 b=CsMESWZmBbEVLKoDOEJRPTkVyOdJvVxMoVtCYBarz7n2LC9sSiejz0Sn6Y2Z82YAdn
 MF4QPZLm1JSs50xuWuU4jAFDiBKjbtjr8AKgiu4eRx2ipKp0SGIJ9M3/SuPkYhmY2RXb
 eaLleYDPmtpD5BuUzKuOpueBhRTybBExlmcSBav8VmofE6nI+rEeWGOPZN31WPSJR8IC
 WT060LonCLXgF8HB21T7asQge2I2PCikKIadoEgDljIydO2NcG0vbc7ieLxquyjPo8e8
 I+wxNzIoJCOfm1lrUNmHuRs/cBdgAZiAquOJ/Pu55e1TJqtgm2NvLBn5eDCDLnWMPdo2
 +MLQ==
X-Gm-Message-State: AOAM532RDPFHyet8Qg22n44IrtmPyolzvU/f1fm7jvuWPhcXr0PbP93i
 N3+PcFe79XRrrjQzGEXSvGY=
X-Google-Smtp-Source: ABdhPJwbWC+RcE86K4AHZ/JXpplW/TP2HIkLpzmuGhlduFpPsZSLMAwwvijlKgZkmiRctKd58ozcKQ==
X-Received: by 2002:adf:9141:0:b0:1e3:1379:4cc6 with SMTP id
 j59-20020adf9141000000b001e313794cc6mr19398453wrj.249.1646123631557; 
 Tue, 01 Mar 2022 00:33:51 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b00381753c67a8sm1919606wmq.26.2022.03.01.00.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:33:51 -0800 (PST)
Message-ID: <d229ad74-b530-af2b-2e01-a60e525186d4@gmail.com>
Date: Tue, 1 Mar 2022 08:30:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v6 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yong.wu@mediatek.com
References: <20211206130425.184420-1-hsinyi@chromium.org>
 <20211206130425.184420-3-hsinyi@chromium.org>
 <aa54361f-6a8f-a616-640a-b9a098d82cba@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <aa54361f-6a8f-a616-640a-b9a098d82cba@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_003353_474994_9FECDF5C 
X-CRM114-Status: UNSURE (   8.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17/02/2022 10:41, AngeloGioacchino Del Regno wrote:
> Il 06/12/21 14:04, Hsin-Yi Wang ha scritto:
>> From: Maoguang Meng <maoguang.meng@mediatek.com>
>>
>> Add jpeg encoder device tree node.
>>
>> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
