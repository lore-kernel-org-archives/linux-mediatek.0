Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38466C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fumu3JLKZhwp856FuysQVRkR+0TlueG1r5wPImZmw+I=; b=Z4PXxgGiw1dbj0ROtJGL//ahUQ
	SZV8RNOOff3lUORKzCCPmQxTtp0E158IGdDKjdYc2uUAM+QsWUl6c6uwMAGa+MQ6NBB12felu0Wyr
	/BF+oaVUu2tMRPMaKMY9HUT9wdhqOdpu+FhNhR+7KLahU12XfBxUxhxYEmdxDRk/FfwgnXExvvSFA
	gAMLhMPICeWCZeoWlxLgAb5qnFlfYaBexX9PXO63KyoBZR1iW7dnihxYAX5wnoh7fVOeRYkFY4zuF
	ZTCFtA7uxZPtuN0RKVQL48xQ1elqI8JHLzlYyy+oQxJiI2PdoqBymdZko6PPwVIG1SN/LQrE05+/g
	BckxXvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pextk-00G0BC-2F;
	Wed, 22 Mar 2023 12:49:00 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pexth-00G08d-1d
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Mar 2023 12:48:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id cn12so26804760edb.4
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Mar 2023 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679489331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fumu3JLKZhwp856FuysQVRkR+0TlueG1r5wPImZmw+I=;
        b=4PM18ToIRJTjDqK8A3zZ3oSydvcFQqxSYomaOYVN1iOD/8g+A7WZ2PPk2tQwKBJODD
         dpMbFH8IYI0TVoEQAWMb/0C9BrGWUfeXOii+eSaDG13lBGjOC9yMWabs2B8Yx37ezh40
         iXtCfHwEB0w2ls/Upq8ZD0aXN44SCZUjR9iU2jTR4RZ40FDzjaCy1RvVSmOH52OpC7iv
         PPztwZAmwbyyOF7fC/4/vIVKVMFd2EapBw/mflnqShvY3PnO0d44qyZj71L36z7NH7G/
         Q0IDmdXfyGEb52Neeby8RhOiWWs0xRscyoQw3Uap+zqUQWAKx0VyG5wSbzE8PtQYNgg5
         FDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fumu3JLKZhwp856FuysQVRkR+0TlueG1r5wPImZmw+I=;
        b=qPe7y6QuvCxf5w6LxJX/XF0Ubp0clDMEswMcPBRMCyskZnagsEb/CuV1d0W6qgQZsG
         PzWNcIR/oeS5rX7usmuMIGGK63HMm0OPbz7XXb/6wjDqDUMg2O6vIxUi+JeNe4azJeI6
         TJ/JVs3PK7izSE08Rk/pB1Ss56yZFp2rl6nyygYfJjZq9osmgS+IjfLMUcG0ikciegxM
         NUGgaubc6UiYDhMGFikNGsLpleBYb6reMmSVCLus8uvd58JPGWIMjJedwJGcL8993PlX
         qVtpz0p4xCukk4XDL8NGl9FyiTpTneyA75mFoyAQzeuoiOZchl0lxy39fh0tZTZtlnnM
         S4zw==
X-Gm-Message-State: AO0yUKUHfS/rdyzLE/T9Pj/KvXGm0Z7uEKtETknDvu20XAdr/FCZCrmd
	mujWAE5is8jH81WQcyLzA/zabyN2o0Sf7r02pN3Onw==
X-Google-Smtp-Source: AK7set9LmgImDdsZ2IHu8jkDjTSPdNbIHDaGmFo+ZWGyFz1m0ni6kr9LUjdRPKba16Kao34k2wkRn8v8a6CJ869D2tE=
X-Received: by 2002:a17:907:7d87:b0:931:f8b1:4474 with SMTP id
 oz7-20020a1709077d8700b00931f8b14474mr3172387ejc.2.1679489331471; Wed, 22 Mar
 2023 05:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
In-Reply-To: <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 22 Mar 2023 13:48:15 +0100
Message-ID: <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_054857_542583_9A2A7755 
X-CRM114-Status: GOOD (  10.42  )
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

Hi Chen-Yu,

I suspect the bug comes from incorrect calibration data offsets for AP
Domain because you confirm that MCU Domain probe runs without issues.
Is it possible to test something for us to confirm this theory (i
don't have an mt8192 board on hand now), when you have the time of
course?
We would like to test AP Domain's calibration data offsets with a
working one, for example :

 static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] = {
                {
-               .cal_offset = { 0x25, 0x28 },
+               .cal_offset = { 0x04, 0x04 },
                .lvts_sensor = {
                        { .dt_id = MT8192_AP_VPU0 },
                        { .dt_id = MT8192_AP_VPU1 }
@@ -1336,7 +1336,7 @@ static const struct lvts_ctrl_data
mt8192_lvts_ap_data_ctrl[] = {
                .hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
        },
        {
-               .cal_offset = { 0x2e, 0x31 },
+               .cal_offset = { 0x04, 0x04 },
                .lvts_sensor = {
                        { .dt_id = MT8192_AP_GPU0 },
                        { .dt_id = MT8192_AP_GPU1 }
@@ -1346,7 +1346,7 @@ static const struct lvts_ctrl_data
mt8192_lvts_ap_data_ctrl[] = {
                .hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
        },
        {
-               .cal_offset = { 0x37, 0x3a },
+               .cal_offset = { 0x04, 0x04 },
                .lvts_sensor = {
                        { .dt_id = MT8192_AP_INFRA },
                        { .dt_id = MT8192_AP_CAM },
@@ -1356,7 +1356,7 @@ static const struct lvts_ctrl_data
mt8192_lvts_ap_data_ctrl[] = {
                .hw_tshut_temp = LVTS_HW_SHUTDOWN_MT8192,
        },
        {
-               .cal_offset = { 0x40, 0x43, 0x46 },
+               .cal_offset = { 0x04, 0x04, 0x04 },
                .lvts_sensor = {
                        { .dt_id = MT8192_AP_MD0 },
                        { .dt_id = MT8192_AP_MD1 },

This example is tested and works for mt8195,
(all sensors use the same calibration data offset for testing purposes).

Thank you in advance for your help.

Best regards,
Balsam

