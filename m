Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEC8C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EeHIO2f2uac1WGfWnHhOthQIjOqpWzUnb/yusYd5Eo=; b=PJQ/AecmL7fCac+SNoH+2gLCQu
	7W9n4oE6hv1I/v81wB8j0XRSOA2gMbwJAd3Dk+yKqfhSuKZZo4r54bqpJ2m6vaSHiZjmFadV/RK5z
	WzhhgF5fqKazG3zOsDrZ3F/KAJWoBzbpep1BU2SzP988IsTIHbro+FRkgtX6jAQ46tGSa2gfjrFu+
	32jT5c5i1V+uI51r4yXxp8LAoO+8g5m0DiHgxpMLzEtXTONOO45pkCWvi+Dm/o+apWbvUfFISo/5l
	s0/724u2f61ITR+xi3wLaydHs+7aC3P16WWfLyYJKBrv2dkvsSa6sgApQUSpJ+vxsUgVVOO74Y1VR
	PtpavgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cg7-007vkZ-NW; Fri, 17 Jun 2022 14:10:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Cg3-007vjF-Kp; Fri, 17 Jun 2022 14:10:25 +0000
Received: by mail-wr1-x429.google.com with SMTP id q9so5923801wrd.8;
        Fri, 17 Jun 2022 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8EeHIO2f2uac1WGfWnHhOthQIjOqpWzUnb/yusYd5Eo=;
        b=fYJZ2xlJH+zGGG5d7j0jNT920bWUhQ/MSKihYcR6D0n+I/J6YBcyVwpkBY6Mut/aL7
         tRvdRoptP8aK6h5v0BBaqlL7/El87mRXZkyCPD8egLw/xjz91ek3hylRn7iS64Pj/JXT
         9ufuuPZc5aKsjzdYfeAi54ITPeAyvrRPs06EHkntrmN90OP6JF44PpHz4TDJaLSf/G1s
         mgV4XBTQPmtIk/RYXM/qfxMmJyhkXuyXcT3rfL+EWvb0VPgdv83/UTSv6F+NcvLkJlh/
         lvwNYKaBFGalg6kfoTALdZ8JfSnDsBfCvSfka/NewJUh6qF3/GGJNo6Alw7c/2Qlybai
         Yp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8EeHIO2f2uac1WGfWnHhOthQIjOqpWzUnb/yusYd5Eo=;
        b=XFaU/yQm28UH7n0dH2ooKEg0mPi7vgc3neLFz+FXFHicEhYHQmkBnzRqV2KFVQE1el
         l9wxWbGbOmQYHUI65IWUpJeaRtaO7hDhIhuMF2RzzxWZ2vfwK8bX5M5eHdvkMZA+3cz8
         IoWT9BjsZrvJZPzgNuBT+qooktD6FLdJSyOYuGbA/3873gLt1rmrjAmVjIISADZbVF6s
         ghefqg92o8DCM+5cdFFzQbcQdyiWOnzwlj87LdE8MygUQnRLQQDrxu05J5eBLOa/eGkH
         sEifvuNoGxbP29fd0MZOjQZvRlvrCxVUUQfZ8r4VX5TfPX7ltTicWx4/B0U4AB69l4wz
         RKXw==
X-Gm-Message-State: AJIora+tf1gL00ZmQR814YYDGBYPlQUcKp9enZcS4bDx5YM3lPP9CzAU
	ukUG3cmLLq6OtXjqwmI1psQ=
X-Google-Smtp-Source: AGRyM1tzF8x7/l1zBh6ZS19NjX7FANIe3zlmc83iNe5NxLwfOharnCi3Rxj8l7qi3TipgKZXD6WIAQ==
X-Received: by 2002:a05:6000:242:b0:210:354e:c89a with SMTP id m2-20020a056000024200b00210354ec89amr9715076wrz.136.1655475022140;
        Fri, 17 Jun 2022 07:10:22 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id r66-20020a1c2b45000000b0039c97cc82fbsm9226685wmr.15.2022.06.17.07.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 07:10:21 -0700 (PDT)
Message-ID: <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
Date: Fri, 17 Jun 2022 16:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Rob Clark <robdclark@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson
 <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220530113033.124072-1-hsinyi@chromium.org>
 <20220530113033.124072-2-hsinyi@chromium.org>
 <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_071023_753802_A367D8AE 
X-CRM114-Status: GOOD (  18.00  )
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

Hi Hsin-Yi Wang,

On 06/06/2022 17:29, Hsin-Yi Wang wrote:
> On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> krane, kakadu, and kodama boards have a default panel rotation.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
> 
> Hi Matthias,
> 
> The series ("Add a panel API to return panel orientation") might land
> in drm-misc. With this series applied, we can add this patch to give
> the correct default orientation for mt8183 kukui devices.
> I didn't send this patch again with the series, since they might land
> in different trees.
> 

I had a look on Linux next (next-20220617) and wasn't able to find the mtk_dsi.c 
changes. What is the status of this?

Regards,
Matthias

> Thanks.
> 
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index 8d5bf73a9099..f0dd5a06629d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -276,6 +276,7 @@ panel: panel@0 {
>>                  avee-supply = <&ppvarp_lcd>;
>>                  pp1800-supply = <&pp1800_lcd>;
>>                  backlight = <&backlight_lcd0>;
>> +               rotation = <270>;
>>                  port {
>>                          panel_in: endpoint {
>>                                  remote-endpoint = <&dsi_out>;
>> --
>> 2.36.1.124.g0e6072fb45-goog
>>

