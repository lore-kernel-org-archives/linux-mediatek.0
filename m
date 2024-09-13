Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3F1EEEC0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 05:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqeBueurHg1MlYbxoLo01Cyqnr241lqjsc3UJHOuPFo=; b=rBA4pNKCgA2kEFYIc7vlzuiEsQ
	Y+gXDCjSSRsaucEfyhRNY9OC+YkUGcLJEtUBsfJ4aHykadn8KL760aTnVehJsc3KzdX5XhMgWLewf
	XaFOhfhONVLzrTj0q+NTMS4ENl8FRGv+tfzPzZWCzUGeDZzJoNGEDqa2UyoY0FRVw9oZwuVuIpieG
	Jpr1VqlKJvljsHpCQ8gsXQxZYaErBKISkhPDi4AOIzSdLJvuAOz0SOoiOhYS2Q/0XZRCAxXqXfn4x
	JsKXn8ADPK5PnSos3eT1r98DbI6Rham77eXI6kjXvbAH7cFksOCEyDobB+2ah2aOMF+A40cPIdavm
	ACL3ZSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soz2m-0000000EzLC-1VeL;
	Fri, 13 Sep 2024 05:40:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soz2i-0000000EzJs-1lyu;
	Fri, 13 Sep 2024 05:40:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so10417035e9.1;
        Thu, 12 Sep 2024 22:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726206027; x=1726810827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vqeBueurHg1MlYbxoLo01Cyqnr241lqjsc3UJHOuPFo=;
        b=je2mDHw/uGi1a+NsK3qYZwo6RrGlg4+Xi4lZnDjpcKnf8Rk7nwUIEn62JfG42tguD8
         62pnx+hcwBAyY0qFjEG6eHm8vXMuThElSchkB5lh+E+Rh8tqpg6y5sF0YBqMbtX95FZQ
         OafMtGkI/Dj0UexHEgzqBS5FvLQKvUKyjiSA9LwYgh7wvIyUsuIfK/X39+43sVMSeR3F
         97aYgaoZKeC2lxEzF+2skCvxvb7MOw0Sb01oWh30E7JDn5FCgzDt3Six0lxTO/aKp4BK
         89Q8BNeDUelbQS6RAarHYt4QrUg9h3gt6Odz4VnA+WPfsgd09bsn7+JlIFjxKNk7FR1m
         Hhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726206027; x=1726810827;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqeBueurHg1MlYbxoLo01Cyqnr241lqjsc3UJHOuPFo=;
        b=iJ9DthfaS5efw6Jl08E8JuxAXBWEsQcwVkf/rnOoGlvV5eK82Wb7SmxPV8BD7kpdrS
         MQh8L0vOTY4a7Vjh71zPucJwEKBy6DDim9kbFx2gsUSwxaPB4q5QE6k9bHOfT+P+oUwh
         IllNDgnGN/MdHUoYGz+8H6qNTU8FAjMjaRht/F0ucdOdxz/FncWzd9+JctNdAoshwkSI
         3p/KumTo6YXq6//H4iMDB+PlL1/ecg4cXTaH/OIEHWOnOSiOizXNx4bEGGqHVQPnJFSE
         K9BuxVJfcfl21Jr8vNa1JBx1HLTRolydl1/z+SsYqCxlxlH2lK/NnPos6QShD7INdHLG
         PTyw==
X-Forwarded-Encrypted: i=1; AJvYcCUvPHaMOMKaEgP1LnEmSJQ+PWbUMI/98KAFKtk0dafw8+Rq2v3rybI5RI8cp9+CC+jxCgL2ettUpw1azK5CiXnH@lists.infradead.org
X-Gm-Message-State: AOJu0YxtEcPEVu4a2+qfy26QmTWLEAt0RorRkuI/AaWPS9+EKDpBgpn0
	W0ylUljSOevqlhWfKkTW4bNSmfIlmBq5fmgki5z9f6jldvWXUcaSE6agkV0m
X-Google-Smtp-Source: AGHT+IHFHXJvqh5YE9WoijwYaXi/zKjLEAnVxSOFH8ymQwiPDwQttWOmZq3Eb18i3jLZBDpzLua8Vw==
X-Received: by 2002:a05:600c:450a:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-42cbde23be4mr74941545e9.17.1726206026206;
        Thu, 12 Sep 2024 22:40:26 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b182004sm11524655e9.46.2024.09.12.22.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 22:40:25 -0700 (PDT)
Message-ID: <69776448-0328-4880-9108-54466e40ddd9@gmail.com>
Date: Fri, 13 Sep 2024 08:40:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>, =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
 <Shawn.Sung@mediatek.com>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
 <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
 <a2cf4e9b9c3343a7398521760934f1740505aa13.camel@mediatek.com>
 <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_224028_491105_CECFAE07 
X-CRM114-Status: GOOD (  22.27  )
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

Hi,

On 2024-09-13 05:56 +03:00, Jason-JH Lin (林睿祥) wrote:
> Hi Alper,
> 
> I think that's a platform issue because it works find in my MT8188
> platform, but I don't have any MT8173 platform.
> 
> Can you help me test the fix patch in your MT8173 platform?
> I'll provide a fix patch in 2 weeks via Google Chat.
> 
> Regards,
> Jason-JH.Lin

I replied over Google Chat, but to make it clear for others on the
mailing list: Yes, I'll try to test patches when you send them.

> On Fri, 2024-09-13 at 01:25 +0000, CK Hu (胡俊光) wrote:
>> Hi, Jason:
>> 
>> Please help to fix this issue.
>> Otherwise, I would revert this series.
>> 
>> Regards,
>> CK
>> 
>> On Thu, 2024-09-12 at 23:29 +0300, Alper Nebi Yasak wrote:
>> >   
>> > External email : Please do not click links or open attachments
>> > until you have verified the sender or the content.
>> >  Hi,
>> > 
>> > On 2024-07-31 16:34 +03:00, Chun-Kuang Hu wrote:
>> > > Hi, Shawn:
>> > > 
>> > > Hsiao Chien Sung via B4 Relay
>> > > <devnull+shawn.sung.mediatek.com@kernel.org> 於 2024年7月17日 週三
>> > > 下午1:24寫道：
>> > > > 
>> > > > Support "Pre-multiplied" and "None" blend mode on MediaTek's
>> > > > chips by
>> > > > adding correct blend mode property when the planes init.
>> > > > Before this patch, only the "Coverage" mode (default) is
>> > > > supported.
>> > > 
>> > > For the whole series, applied to mediatek-drm-next [1], thanks.
>> > > 
>> > > [1] 
>> > > https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next
>> > 
>> > I am seeing broken colors on an MT8173 Chromebook with next-
>> > 20240912,
>> > which goes away if I git-revert this series (commits 1f66fe62cc09
>> > eb17c5909481 a3f7f7ef4bfe 59e9d9de25f0 4225d5d5e779).
>> > 
>> > To illustrate, I took a picture [1] of some color mixing diagrams
>> > from
>> > Wikipedia [2]. Do you have an idea of what goes wrong?
>> > 
>> > (I'm busy with too many things so I don't want to debug it now...)
>> > 
>> > [1] https://i.imgur.com/tNFvovB.jpeg
>> > [2] https://en.wikipedia.org/wiki/Color_space#Generic

