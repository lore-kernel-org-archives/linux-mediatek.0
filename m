Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9398C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p08chQNSh3PD1wtmZIuc6+rRft68Xk8lY5p5BHfJ4CM=; b=avDWrWPgut9kgyqjlxon1Xe99V
	tWbodNqXxW1NZ8Xaz+15AUtP09cKn6+k4g1wjvTBgCmEMMr/WrYApo6dAKaviUhe/0om0pwNJzVgt
	5+I+Z4mnzREuuqHcw42wWtS69JrNszV95zYTiKANP5NH+Inzh0qpZTt3cho1uiMDoRCen+Xitn90k
	nyjlQcFpXnr7/1wca/0Idf+1XmGKH/eBgLHSs/gWif59q45zBpGns/S7hO1UbX8IQzNp9kSmdvAsx
	NFZABDVyZl6Ne2XX3+WXNYWIoROKZZPaeDDrl5lUAM5d7Ka5oSOSOkNUpXQidemv8bTxY7j5f3NnV
	fbEmBU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCuxG-00AlNc-0K;
	Tue, 12 Dec 2023 05:05:14 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCuxD-00AlLu-08;
	Tue, 12 Dec 2023 05:05:12 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1feeea75fbfso3483852fac.3;
        Mon, 11 Dec 2023 21:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702357504; x=1702962304; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p08chQNSh3PD1wtmZIuc6+rRft68Xk8lY5p5BHfJ4CM=;
        b=e45ZGYb+lpQsSXtZKLBR/uXu3K2gKLFcvcKa40aqE0mAyGsbbzf57b9nTBaswIjxEu
         94JhB4XEXiHgy5cU0++UEW9/sIRLt4sfmoQJW5PBl+01m2S6NS8FnffY43tw52HGmB/t
         h3+8QzO+bhVVi2VoHMOQCRU9H4bdmactcH6pIEieCtWvooJqCW6gc3XZdZEGwgwMwZKc
         guFYwRURwDeA883zUH2GB47o3MyoWbX9Mv6HxGXCQOtV1NPuoc64FgH5q+pVR9NKWgLi
         eHiNLTZkwItB61dFvWYofjrEeve7+pKJhNrC7dal71imdCouq/rCkzMRFMKYAnLI+UZ/
         wyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702357504; x=1702962304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p08chQNSh3PD1wtmZIuc6+rRft68Xk8lY5p5BHfJ4CM=;
        b=eq98vup8ftXgwt6k/vjzn5G0Wx8jj+gHopPqIrJLk6a0Bzs7myRWXxBMqMihQKwWrY
         HzFi64cEFCH5GwDV0vm0ykemf8/mxccNDy6goR7Ov00FakMHKNftOS4R/Fqw+Yv3sB0g
         UmMsK0H59DulTR7bqjFQiaUZLVog2L92uSwbmUAXzQtdSF4aAef6bTH/wbJD1vq6Mh9F
         7TfUID0xkjqeCiPRYUc2PK+Oe5ygGZks96EG+KRtirIU5mjO3oMdP8y3wIzWaZVpDIeG
         F+//Ica+wtzCU1PkZ/8OqAVEgkrNDJjYagQ9ELFwek3UAXjai5G6xxSii6rpyYUaXpi+
         tlXQ==
X-Gm-Message-State: AOJu0YydBEvs99jXAUaIM1sAv2BJi8OK8TqtqgYQqmJGT8hdL5UC8blf
	y9v6dla+hR6L53KHCAAK4ywyLts2YBlh+wthnp5HI/fhkojxoQ==
X-Google-Smtp-Source: AGHT+IGWqv5/TW2dVlT8w2gB3JQITBAdmLL+a1qpOqc0LzFyKSebQYVDrMD929RiaCZSrSLyBklpVP1SzZmW39NGRYo=
X-Received: by 2002:a05:6870:d8b:b0:1e9:96c6:e04c with SMTP id
 mj11-20020a0568700d8b00b001e996c6e04cmr5320921oab.32.1702357503830; Mon, 11
 Dec 2023 21:05:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKpemQKo2gigO44amj=eFUXgUnUeSmiOoTbS8GdXMx3O07N1vg@mail.gmail.com>
 <CAGXv+5E4TXrPmhb++r3vMGA4WoPc=covi7_=zgLLcOhGt9UBgg@mail.gmail.com>
 <CAKpemQJDf9RqeOStB4Rm5hzuQdzYF6JEbuz00Cr-a80cWZKR6w@mail.gmail.com>
 <CAGXv+5HuxOtFfdWdocspTcDRytCK+0Ny+c_aFLJyHCUbYTboJQ@mail.gmail.com> <CAKpemQLyieDP1r11v1WJ+-SXeseUiPKsCK6SBf-FSCOxGkEWHw@mail.gmail.com>
In-Reply-To: <CAKpemQLyieDP1r11v1WJ+-SXeseUiPKsCK6SBf-FSCOxGkEWHw@mail.gmail.com>
From: Bret Joseph <bretjoseph@gmail.com>
Date: Tue, 12 Dec 2023 07:04:51 +0200
Message-ID: <CAKpemQJkFxDnqob4NpqYc7iTWNiaoVUJ+rFvw+nRv0mYvoNJcg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] regulator: mt6358: Add output voltage fine tuning
 to variable LDOs
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_210511_092849_9B787A67 
X-CRM114-Status: UNSURE (   7.66  )
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

For the LDO regulators that were not probing, I changed the pickable
regmap to just a regmap function.
In static int mt6358_get_buck_voltage_sel(struct regulator_dev *rdev){}

For LDO1
        ret = (regval & info->da_vsel_mask) >> (ffs(info->da_vsel_mask) - 1);
returns
[    3.470672] shift exponent -1 is negative
[    3.470910] CPU: 7 PID: 63 Comm: kworker/u16:2 Not tainted 6.7.0-rc5 #3
[    3.471278] Hardware name: MT6769H (DT)
[    3.471521] Workqueue: events_unbound async_run_entry_fn

fixed by adding
        .da_vsel_shift = 8

--- linux-6.7.0-rc5/drivers/regulator/mt6358-regulator.c 2023-12-12
05:32:19.703310500 +0200
+++ linux/drivers/regulator/mt6358-regulator.c 2023-12-12
06:25:06.855132318 +0200
@@ -27,6 +27,7 @@
  u32 qi;
  u32 da_vsel_reg;
  u32 da_vsel_mask;
+ u32 da_vsel_shift;
  u32 modeset_reg;
  u32 modeset_mask;
 };
@@ -108,6 +109,7 @@
  }, \
  .da_vsel_reg = _da_vsel_reg, \
  .da_vsel_mask = _da_vsel_mask, \
+ .da_vsel_shift = 8, \
  .status_reg = MT6358_LDO_##vreg##_DBG1, \
  .qi = BIT(0), \
 }
@@ -209,6 +211,7 @@
  }, \
  .da_vsel_reg = _da_vsel_reg, \
  .da_vsel_mask = _da_vsel_mask, \
+ .da_vsel_shift = 8, \
  .status_reg = MT6358_LDO_##vreg##_DBG1, \
  .qi = BIT(0), \
 }
@@ -381,7 +384,7 @@
  return ret;
  }

- ret = (regval & info->da_vsel_mask) >> (ffs(info->da_vsel_mask) - 1);
+ ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;

  return ret;
 }
@@ -478,8 +481,8 @@
 static const struct regulator_ops mt6358_volt_table_ops = {
  .list_voltage = regulator_list_voltage_pickable_linear_range,
  .map_voltage = regulator_map_voltage_pickable_linear_range,
- .set_voltage_sel = regulator_set_voltage_sel_pickable_regmap,
- .get_voltage_sel = regulator_get_voltage_sel_pickable_regmap,
+ .set_voltage_sel = regulator_set_voltage_sel_regmap,
+ .get_voltage_sel = regulator_get_voltage_sel_regmap,
  .set_voltage_time_sel = regulator_set_voltage_time_sel,
  .enable = regulator_enable_regmap,
  .disable = regulator_disable_regmap,

