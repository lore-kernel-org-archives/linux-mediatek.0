Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95C9C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/0mDcIFSqHQ/My738bTZT2mjhpWfk/KnpoBd1WgU1c=; b=ytJQlmy/tldgtKCPpDSaUxyZ/1
	s9BSRQEul77SfsMdcsVFfBNbBg+qc456headIL2ESi+WiHDe46g9OJjDOEkPJDFjpsb/uxaC9KxKL
	GCn+aD3iRx1beIfFobDvTDkYMkb5wcPw/S3NklTXdEQ1EiRuSNDQetb/mXGrTQOvT+OzQwVgqK8VO
	KXOVnZkTxhx87gF8+WoCUrNGy2uRayWX+Kxk8hwh6ZKbdJt/QNnVn070pXTkYNwV16f4IH9YLtily
	fTXDcUvYXXvm1cljNqhZIhTVfOVomqkCrOycr2GF5znsq6zGyhfw6WsjUCPKetXX7yUFr3EVEwNWL
	r2eFxfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27vG-006a6d-1E; Fri, 17 Jun 2022 09:05:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27ur-006Zv2-MO; Fri, 17 Jun 2022 09:05:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id i10so1158425wrc.0;
        Fri, 17 Jun 2022 02:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o/0mDcIFSqHQ/My738bTZT2mjhpWfk/KnpoBd1WgU1c=;
        b=dAaofN78+s4gFUVaIZ/nesusmR50ONgOtZ4su/WxPvXUq1uGErzGDltaEY5sYNQNZu
         vPaQG7MRjYmBjy3fOYTGflgW+h0bY+eedmQIzG2X1B66UoKYNTj38VHXFXUzq2w3egYc
         vx2PMzcy5jiC1dsqLu0Gn3uB2j5roTyVGJT3pC/eKEPM/afaxzfuOYrMp6w6wyua9/fd
         9Nj8Vb2O/FHpsjuZ0UWGG4KmQqCDMqlcSRHQOtGRUy5aV7uvmVVflFUkInLcwFi/WGfi
         JrSsf22hoYStFwsEa4P4tzdLhDBbpQn9PLfaGHWr78OaHRbZvGFlV2/7N+VAuNBgzNzY
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o/0mDcIFSqHQ/My738bTZT2mjhpWfk/KnpoBd1WgU1c=;
        b=EupQR19K96pzqkUmMvriPHUBR5A7FbsYTUkTf0Dd4mm9FoZqFq2YnbtVzfEos28ZYa
         tSBbNkvyhGlzgcZvYLTeS+z9oQx4+JQLUvHCucYyoyViECxvdb4TKB7DpP9jd4Nt7+9F
         dM1/ZcIj9p8x8WWBnDzqB3VEr9XCiyJTgXISJSpI9f4yBGQdYhhsgDWEoXwjd0d/MFjT
         kmIwC61kuwB0rTYaacgaT3iSnQVQBo16+C9YYhgH89ZYoEOe5XCbCM56HSIKWtgJksNn
         /SsNn0q9x3Blzf6mKw9AgYcGB4cHaxTnbg5/xN/H/yJvgoEpJrqHqOEb5jOMfOso4pPI
         kdtg==
X-Gm-Message-State: AJIora+3ZuPPt/YUl1YpIeT8ihD+X74EWiIjpmsaLBl/0bgn/nkEkEZ2
	xO4co/0CMZ75GNqqrA53uZE=
X-Google-Smtp-Source: AGRyM1vQCHbGNsNTZ28s2YR1fjPVRB8ztyhZ6H2QaXGbiVCH22jD5I467k/8uSrhKWH3FoPIeIx2hA==
X-Received: by 2002:a05:6000:2a9:b0:218:4bf5:a43 with SMTP id l9-20020a05600002a900b002184bf50a43mr8481741wry.154.1655456720070;
        Fri, 17 Jun 2022 02:05:20 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d614e000000b0020d09f0b766sm4004776wrt.71.2022.06.17.02.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 02:05:19 -0700 (PDT)
Message-ID: <0a01e2e2-b188-d670-7063-2e35fc3cc350@gmail.com>
Date: Fri, 17 Jun 2022 11:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: adjust whitespace around '='
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, arm@kernel.org
References: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
 <1338cf79-d57d-d13b-896b-abc0c726a238@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1338cf79-d57d-d13b-896b-abc0c726a238@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_020521_807355_43A81B38 
X-CRM114-Status: UNSURE (   9.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/06/2022 22:36, Krzysztof Kozlowski wrote:
> On 26/05/2022 13:44, Krzysztof Kozlowski wrote:
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Output compared with dtx_diff and fdtdump.
> 
> Matthias,
> 
> Are you ok with the patches? Any comments?
> 

Both applied now.

Thanks!

> 
> Best regards,
> Krzysztof

