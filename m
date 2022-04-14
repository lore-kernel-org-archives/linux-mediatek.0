Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6MX0Xc9YR+tAd9ka2fg7ECvHQcVfc2Mpbv2yy8zO6U=; b=ADwJLI+J1Mj0AW
	7y3HEI49uIpmu26ra/fFSqvfVTRaighxsqxhQlSNeAEdYGuuY8lSi89ppxSXHLRPhsi/RYKv7a9+Y
	GebiA0a2jmSgnbKHoKAYKrERn+BSTI+8H9CdMjABFwJBfdjAzx6LxJUpMlDUhtoX+2m4N1F9njdOR
	Fg/rGmF/FuuUnLoJHkPHGWCqTjMPzkthH1bCZ77vTBbjBMk1Fk2Yi00MqtRmULGNmbDAV3Ux9/0gM
	uwnL8YEFYAjM0btBi534rqRajPmXaiPOEmomzg5+C8RzSbFRJQWJY0lW00nI15vyWdm6nuTXDWiJB
	vptT9LI+zdXIyvKCaawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7RS-007PtD-Da; Thu, 14 Apr 2022 21:55:54 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7RP-007PrW-BN
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 21:55:52 +0000
Received: by mail-pl1-f180.google.com with SMTP id s14so5789279plk.8
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Apr 2022 14:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=p4J2D9Y15bbl4a0Y5YpwKfGg6ieiA8wDXYDXSztcbAg=;
 b=Tr9x+FUo2oLE624ajFAEoZDMrunKcuc5mQBRiKWYLf+IqY0gzDlpPD09Vz9+aUhgHe
 zBjSFmJroPCOzWy4osg9D3x1p+V2/v4H4LFdldppn0bFytLzvpnwwcaGhtngUKwQdCHW
 QlHZzAoECY/UnraXGZahudpkKNTvPtUbJuWWIZ0+KuvRuzKsxDT9t1Er+c6yGfR0xEQs
 sho8/KWJsowq1rlkJhVBrMXOV32Y4KgNwALK+EXs6RNNc1zXPDqDpDtPxwR7OGQau9e/
 ojWtKNnskC9lzflRApuE3RfmN39H1ab82NxUjKn8hGGS6Tk4bElwnGrCcGQLYpMoFucA
 Xtnw==
X-Gm-Message-State: AOAM532lBsgBmWR3eqzh9pHPvxnUcQf9z9neT60raiNpg+1JO2ZKgrFO
 0urpZEjKzztULMB+Yr2EoVjM3A==
X-Google-Smtp-Source: ABdhPJyib/M2xHCFWUypNYp+D6C2ZjbS7N2LMqLSJuQA+fqFc93KdJyuod9xrHqWJH5vlAixigjz8w==
X-Received: by 2002:a17:902:b7c4:b0:158:c493:e0fd with SMTP id
 v4-20020a170902b7c400b00158c493e0fdmr2748522plz.20.1649973350236; 
 Thu, 14 Apr 2022 14:55:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 s24-20020a17090a441800b001ca9b5724a6sm2711383pjg.36.2022.04.14.14.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 14:55:49 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Johnson Wang
 <johnson.wang@mediatek.com>, cw00.choi@samsung.com, krzk+dt@kernel.org,
 robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, jia-wei.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: mediatek: Add mtk cci
 devfreq dt-bindings
In-Reply-To: <39152c86-ca11-2792-6b25-ae55ffb47b09@linaro.org>
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-2-johnson.wang@mediatek.com>
 <855d7daa-45d1-d6d8-32bd-51778cf58392@linaro.org>
 <fe7d2b878c18a42ff36ebd9911ecb562fe29c953.camel@mediatek.com>
 <39152c86-ca11-2792-6b25-ae55ffb47b09@linaro.org>
Date: Thu, 14 Apr 2022 14:55:49 -0700
Message-ID: <7h8rs7fhy2.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_145551_427191_33C9AE81 
X-CRM114-Status: GOOD (  13.14  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 11/04/2022 14:10, Johnson Wang wrote:
>>> Also please put it in the "interconnect" directory.
>>>
>> 
>> I don't really know about "interconnect".
>> However, it looks like a Linux framework about data transfer and "NoC".
>> 
>> While this cci driver is more like a power managment which is
>> responsible for adjusting voltages and frequencies.
>> In my opinion, "devfreq" should be more suitable.
>> 
>> Please correct me if my understanding is wrong.
>
> devfreq is a Linux mechanism, not a real device/hardware. We try to put
> the bindings in directories/subsystems matching the hardware, therefore
> devfreq is not appropriate.
>
> Whether interconnect - or other subsystem - is appropriate, I am not
> sure. To me this looks exactly like bus bandwidth management and you
> even use "interconnect" in several places. So interconnect matches.

I agree with Krzysztof that "interconnect" is the right place.

I'm pretty sure CCI stands for "cache coherent interconnect".  At least
that's what it means for the Arm IP.  The Mediatek IP being described
here certainly seems like the same thing.  It's just that the only
aspects being described (so far) are the DVFS parts.  Even so, I still
think it belongs in "interconnect"

Kevin



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
