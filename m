Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739A9C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Apr 2024 23:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=; b=38kLqog0xDhZiOMyGg9yyLem66
	S72/FdkmvPQw671qeIgXTV1q+GAjj0TK9BtJP1NxQ/bxTD3X3P1hcIJeK4h9UjEVm5idMEUZQlRPp
	sV1r6ghLZvnPuA42tzLrb0fEr2bQA7OofkEfP6UVTMxOzNg4dlR3fZF7Ny0IyiolYomwQCD5aMQsj
	v8pZYRtiBuF6a8GSCr12bwuYnq9e82ee+y9Bhki1TtTc+SJ5+9zk3gmRoOiFapMEgXKW1sQAIIaPn
	/MSzmG6ykxDu/Vf4WaZKvBWQxC/zhYNV4WYzKR77J/4DUIu3ULqv7NaqrR8XHfePPInrz+rnrj//f
	03JZ3tsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJhE-00000009Kh5-3LWT;
	Sat, 20 Apr 2024 23:00:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryJhB-00000009Kf5-2aWm
	for linux-mediatek@lists.infradead.org;
	Sat, 20 Apr 2024 23:00:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso4292749a12.2
        for <linux-mediatek@lists.infradead.org>; Sat, 20 Apr 2024 16:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654030; x=1714258830; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=SeuslA4yRe1kR/KgjhhMUuFY66ecaWU0sKUYRsx5FMKTGO+fgGC9pL5ArkMjpSD4zY
         eVM+fH3zo7wUp+0OfWFB0NUwkBYbwXx/NJl8dHRWGVdTb4KoQUh/+XM5YZ2S3SrpW8OH
         AZSRuYQB9QkYD+JZq0hhqCr+6b2m+3pirL5E/0vGtlESnvQRpZjz8MbHqBHxHtsMQ9vD
         a9kf19MU11v7BfI27LgzSpfDg1L06bPiEWE7wWb/7GnynhUZzicafF79fAwsIpWDCdjf
         7WN89MzzX+Od4Izo6f0RbppaxshUCxbQvOWACNGGKT7t8/y1nDSfvtGH63eot347oDmt
         1Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654030; x=1714258830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gS/avcdT3uZE+/g4l+u7eNrKfkVrRBnHoxOYygE+RDE=;
        b=uDvIjRr/RdtY2Vz0MxmDd3erFa+8fd7OklliX9RzH31AqxnxnL1zmLM6lnk1vlbtjP
         pwx4OhjUU4Z+6TcJp/qc72De5Bg/9ZoUvLJ2uArASmPCIuLOq9V68rSlKvPQXTrLD5u7
         200iURqPu5PDKjGe2aMr+JfPJpgpQkJU2p3iDsIkYwZhChnLge+hTu670f1fgBBV3EaY
         aV8+0P9ObvoGAGRJv+YuSHsiAGnutwP7KmSXGps9O2mIwBGz49cJTAKd2d3diuwHvXw7
         bV+bzsjFLbuTHgjYrV/fSyrfkdjw2OApDnwrSqbn+DPknBLhXnqNDSk3fRFwmi8huc6z
         9ESg==
X-Forwarded-Encrypted: i=1; AJvYcCVFEQx5wk9ReIToAw4+wOTOyWdNQrzIp8j3OS42sp/2TVoJJYWYQ8OPfhJOyOxvmjF0qB8MZeDWItuJiEZ8GXC7dx4w/IykzkylMNqmfi6qB34l
X-Gm-Message-State: AOJu0YzuV0TnHHVHFYVilpdX51mCMD+EogBzMAaJguVqZm8zzg0TRsuj
	MccGrA3/7wQ4HgOZ2NXyqmAVEGPREkwZ+SaMG6pvIV2nWhOsHYjWZExvkiV67V8=
X-Google-Smtp-Source: AGHT+IH4lwqPioLpoIzW6dLhOLlXPP3zMShUOxH0TJXNnW3DIij9PpcqOmEnmKfQrSavTUI2UaMo9Q==
X-Received: by 2002:a50:9ece:0:b0:570:cd6:8ef with SMTP id a72-20020a509ece000000b005700cd608efmr4297896edf.29.1713654029517;
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b00571ef2c1308sm913940edb.12.2024.04.20.16.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:00:29 -0700 (PDT)
Message-ID: <9f44c386-4be9-4904-bf67-f0e664773baa@linaro.org>
Date: Sun, 21 Apr 2024 00:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/26] media: pci: mgb4: Refactor struct resources
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_160033_710326_B6ADF282 
X-CRM114-Status: GOOD (  10.14  )
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

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> The struct resource end field is inclusive not exclusive, this is, the
> size is (end - start) +1.

", this is," doesn't parse on my end

"i.e" => that is, would be more appropriate I think.

"The struct resource end field is inclusive not exclusive of the size" 
which I still think is a confusing statement.

Perhaps something much easier to understand is called for

"The struct resource end field signifies the end address not the 
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size 
from the offset as is currently given."

Other than that, I think its reasonable to assume the mapping != 0 - 
0x100 inclusive.

Please consider updating your commit log and if you do add my

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

