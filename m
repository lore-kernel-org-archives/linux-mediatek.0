Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D23C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THyFVgTIcmaD4kFbqXpq5JtaFtOuYnIOXXc1OGd8HRw=; b=knUOhuDzoj+Wsz
	9xqYAkL/V+gyU0Jpwl7vvJ5mrS8aOC4IHKqOFy94y8PkI638Q4eyqbBVKzCRsIPynDX8IJgrdp0Y1
	QFMSFwAthe3sQ1gghoy6I0go3yeODkfLhIiFAKaGjC+AlZiSQPMHSnxIsteJMP6Id3U7/9dLMkzUS
	mclUCLCSY4zyudeLmyXlNSfPooUaqMqZZU7zFprFrtzqw6KckcBDkpdvI0NbzP0ZuTclrMGOhf8ub
	+ZE+5qIvryuTdBpsoBd/kjarvv0CSjd0ZHaLIm9ddH/enWUHacAvnENRhUIj/Dz42vsIM3W3dDuhE
	A13XbJojG3t1pnwN+/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogfR-005g0B-1G; Wed, 11 May 2022 07:21:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogfM-005fwY-SN
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 07:21:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id i19so2152338eja.11
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RXqalM416ApPrla/4DErz/ii+vIxKRe2oyKQomPkyMU=;
 b=weKbfzvbT5aLuUAztiVaLWv9yObZ4ovS1g0mJE8aTbCrP+3IqUzozCgtA/QxA8liBW
 xlSkA3NAx45i+qKkSJyNGEIM8KOU+jFeBkHHlhAgMVfq/+TLcFlAfJm7dNrr6GFk7bG0
 kopTrFWc0gM92nLNI340RBiRcX1j5oofa6vOdJFFnie2Cp0DErgv++KsgG6PoI7vQ+a+
 McjpZqGE8bfJilA5FZ7akhW2HlHFiQxJaBl6rt3iWNUHE9h27q34eX69Bktzx/mDZO/u
 o/kJY1T+JpaXqfyD2HgBcDyomJlXPrGER93rAJdfCyph8ENxOnQV+GYcMU33YM+lGve9
 LyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RXqalM416ApPrla/4DErz/ii+vIxKRe2oyKQomPkyMU=;
 b=Ro8wjG7khA/R+5ZeR6OYExwQ+wIZwUpg84ZiPGCcAKrXx90DpHMcLoWln071xf+qKw
 mWp2Kj6IUKHqNnF4uDLt6JzzB0MjsnWDWXWlzW2x5DYidSFoIFE/t20X6sUeSAqZja6b
 +199uwZPnztFF8Yt/mkNjhBSMHo+75uauC7C1DAcG0ywfoncOhxZhdsauF29L8JdAv1y
 S011el2GcKDCB2Yp3nHHNHhPcMJBMTqCereLv5VapJZoDGYeP9inz7nl4rY7ylvyoW13
 uktkeINy1Lk1ASZcH9IJqkN8g1YizscNsBbam1r8VAg3w+wqsXPUqRwe5NJR8CWGMyMa
 ZRzw==
X-Gm-Message-State: AOAM532lTC6M9cqmEycuofRfuILuhfaY/6ePm0JLFZuWfHTdbHxPaeZR
 OL14qvdFhVLMfQ+a7k3HamsVBA==
X-Google-Smtp-Source: ABdhPJxcrj0KplZqqraMGc5jXewWMW7uSDQbjHFyf6/MFSIOrKtW7ZaBrpHpJK+X1+Ie2x65n6aXqA==
X-Received: by 2002:a17:907:1c82:b0:6f4:d2ee:2f8e with SMTP id
 nb2-20020a1709071c8200b006f4d2ee2f8emr23589094ejc.714.1652253705131; 
 Wed, 11 May 2022 00:21:45 -0700 (PDT)
Received: from [192.168.0.253] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006f52dbc192bsm633470ejy.37.2022.05.11.00.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 00:21:44 -0700 (PDT)
Message-ID: <b6ebc33b-dd42-fe01-27be-c0d312548f8f@linaro.org>
Date: Wed, 11 May 2022 09:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
 <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
 <CAGXv+5EHFjqiVQbXgcJWCo+TmaTU_z4e0g85beMLCNjyx5qJcw@mail.gmail.com>
 <0686125d-4984-5dcd-32ca-4eeece09d7c3@linaro.org>
 <4d2b1c2c4ab27ba96d59b9a0e3adcdab311ec897.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4d2b1c2c4ab27ba96d59b9a0e3adcdab311ec897.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_002148_983503_FED1B59D 
X-CRM114-Status: UNSURE (   9.02  )
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

On 11/05/2022 04:26, Rex-BC Chen wrote:
> Hello Krzysztof and Chen-Yu,
> 
> Nancy thinks our IP is more like rdma.
> Blitter may be somthing for reading memory and writing to another
> memory, but we don't have the function of writing memory.
> If we use rdma, is it ok?

Sure.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
