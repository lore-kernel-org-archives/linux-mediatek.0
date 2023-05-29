Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF34C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iKyeVxpYOPIGYe/Lxm4HI6qu/yiKmBXO8zVnrWLpCU=; b=KWLDSgvXsvdk9BO4ie4+ClZ/qI
	dGdp/6jzZ4FmjNi4DcaYalP7ahTH5ofHzeI7XRhUmOF7I0dUnMI8WJIlxY92t6c9cSkBksJDFfVwH
	GpSUaD6uwKAhnaP9AcVutYGHUE+xZcmV+/tTqpQIOgOGEoQGHsj3cTpEeDx21tzvs47PSm3aA32qM
	15vYTiYS1ZM0PxF8eOIsJLX1DOInd6fu8Dsbt1uipp776yS1FNnfW2QMkHaTfVOmNXCucLvnNI6E/
	rcOEWFRIlVWYXrOhmFBdR7rZhJBGVL+cBazQy+IAOX6lH+ihZ60Ulz5KUkI/iba6BlzdnieoblKW6
	puLd8EzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fjU-00B7Dw-0b;
	Mon, 29 May 2023 16:28:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fjQ-00B7Bn-0o;
	Mon, 29 May 2023 16:28:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso36521165e9.0;
        Mon, 29 May 2023 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685377704; x=1687969704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2iKyeVxpYOPIGYe/Lxm4HI6qu/yiKmBXO8zVnrWLpCU=;
        b=EpgmH9C6n5uyhLbAytYKg1lA2SVWmxLhgqXm1xmhHfyRF0cp7zejDIcXKiCOd/EkHc
         lJIpPh7f+lCohgmAvAACNj6NtHaPhXMHKg9a/1/VIYzTiRhn6x2LWHZJi68XifC3mRJI
         M3Z4b4rjMXd+jU9mNWH6+Q9me/xHAkVmLSql84N+hYQDlhrXNMp5t/3z6xDJly6Vv+Xb
         +VVlAxN3nrAj3MkDBuSILGgXIKAVFZ5TnPECDlY3JGBc/ph6RWAStiyGZMvTDLIgVWBO
         nbOejSBvsD/+OMxkRwRl19Bgf7Rsp3Y7zuinC3hX3Q9e+cVV9V0Np7Q/ycx4MsnnzGgA
         +Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685377704; x=1687969704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2iKyeVxpYOPIGYe/Lxm4HI6qu/yiKmBXO8zVnrWLpCU=;
        b=YudVosuJ59Ng9rdlArFUSe1ZJx6unXXptV+M/SDrMitprVZ/J5lv+09nKl9+oApWy5
         TFMEicwWjfQY3U9sWGG74fzPmmalDPPw1b//fKnCzDCcGNvRyAAsNpaJ4LvMDmXpM0sn
         jhtG1sfdgzo77i1UzCmQrNq9z4Jgfzpfyw5kvDtmei/eGZkDmJg3Lw5E+4kfECiqQCXL
         5j0kavfP485IGaZaMYjAFte8+AUjYlaXBTcMM9kEy9QXLJ+Rq20CSBrknBLOrGqpPQ+B
         zx5KuB6wQ3yTn1fgQgFGTj20nyIxm+k/f5T005R558a+x/lQaragACJ6RNiHi63f6txI
         DwXQ==
X-Gm-Message-State: AC+VfDzBjcpYgMIQsaPqbwt2iupNX+HK4Xu4ZRmeCRCbf66mMUjSgTn9
	jhSaRRbIoXi4lkKyji0wRyo=
X-Google-Smtp-Source: ACHHUZ4nt4/ZUaLSDt/sbuRs0jUlCrpJSZ4JbtG0UP+yrn/Tqv+Tk0qeFK4rvij2BzsefX+Pdi2pHg==
X-Received: by 2002:a1c:4c04:0:b0:3f6:962d:405c with SMTP id z4-20020a1c4c04000000b003f6962d405cmr8550475wmf.41.1685377703937;
        Mon, 29 May 2023 09:28:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k5-20020a7bc405000000b003f31cb7a203sm14715125wmi.14.2023.05.29.09.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:28:22 -0700 (PDT)
Message-ID: <3069dcf7-28e0-e7f6-11d5-9bc286d7d6e3@gmail.com>
Date: Mon, 29 May 2023 18:28:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
Content-Language: en-US, ca-ES, es-ES
To: Icenowy Zheng <uwu@icenowy.me>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Doug Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20230526100801.16310-1-uwu@icenowy.me>
 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
 <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
 <6996788b112f4795d2930a6664b3152cd9a380a8.camel@icenowy.me>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <6996788b112f4795d2930a6664b3152cd9a380a8.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_092828_293427_917FF89F 
X-CRM114-Status: GOOD (  24.22  )
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



On 29/05/2023 10:45, Icenowy Zheng wrote:
> 在 2023-05-29星期一的 10:02 +0200，AngeloGioacchino Del Regno写道：
>> Il 26/05/23 16:24, Doug Anderson ha scritto:
>>> Hi,
>>>
>>> On Fri, May 26, 2023 at 3:09 AM Icenowy Zheng <uwu@icenowy.me>
>>> wrote:
>>>>
>>>> Currently a specific panel number is used in the Elm DTSI, which
>>>> is
>>>> corresponded to a 12" panel. However, according to the official
>>>> Chrome
>>>> OS devices document, Elm refers to Acer Chromebook R13, which, as
>>>> the
>>>> name specifies, uses a 13.3" panel, which comes with EDID
>>>> information.
>>>>
>>>> As the kernel currently prioritizes the hardcoded timing
>>>> parameters
>>>> matched with the panel number compatible, a wrong timing will be
>>>> applied
>>>> to the 13.3" panel on Acer Chromebook R13, which leads to blank
>>>> display.
>>>>
>>>> Because the Elm DTSI is shared with Hana board, and Hana
>>>> corresponds to
>>>> multiple devices from 11" to 14", a certain panel model number
>>>> shouldn't
>>>> be present, and driving the panel according to its EDID
>>>> information is
>>>> necessary.
>>>>
>>>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> We went through a bunch of back-and-forth here but in the end in
>>> the
>>> ChromeOS tree we have "edp-panel" as the "compatible" here in the
>>> ChromeOS 5.15 tree and this makes sense.
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>>
>>> ...in theory one would wish for a "Fixes" tag, but I think in
>>> previous
>>> discussions it was decided that it was too complicated. Hardcoding
>>> the
>>> other compatible string has always been technically wrong, but I
>>> guess
>>> it worked at some point in time. The more correct way (as you're
>>> doing
>>> here) needs the DP AUX bus support and the generic eDP panels, both
>>> of
>>> which are significantly newer than the elm dts. So I guess leaving
>>> no
>>> "Fixes" tag is OK, or perhaps you could do the somewhat weak:
>>>
>>> Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move
>>> display
>>> to ps8640 auxiliary bus")
>>
>> I remember I didn't change the compatible to panel-edp because it
>> didn't
>> work at that time, but it does now... I'm not sure what actually
>> fixed that
>> and if the commit(s) was/were backported to that suggested point, so
>> I
>> would leave the Fixes tag out, as that may break older kernel.
> 
> Well at least I developed this patch on v6.3.
> 
> (In fact the same kernel config do not boot to system at all on
> v6.0/v6.1 when I do make olddefconfig then build)
> 

I applied the patch without the fixes tag. Lets stay on the secure side to not 
break older kernels.

Regards,
Matthias

>>
>> Anyway, for this commit:
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
> 

