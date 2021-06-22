Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E02EC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 03:21:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26D336120D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 03:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26D336120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ingics.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BYoXL+CjmbLn27GMsCVpeoUtnemSid57geaQX+xSCwI=; b=jTVbTZxS5obJWl
	ShTCu7M9kCmFAgk52zoxt2FaGg7hxoZzs/hg/A7C8tTRNf/Y+Qrlb2y2lL+9XvB67CCilu547XBvK
	EoMiTtySaaLbNPrOwxpMJ4KOyYNo6a0oyR3YMfTp/t+V5vL0xhkGD7/IALbHYuTalMtkCyxEqTyJk
	mfN66OqwnPLRY+dp0gl+xNYl1mlfHkbyMA/Mz6j0UtsXaMH3wNzjSeTSGMo3SW/Sp3Kisz2FAhRNf
	dAEu5BF6FdWOTbW4CkxVikCaCwUkfwxt2EMvKvcZFuayhCIhCzf+MBtZE8NTsLYXSIDgV3dM9p8Ar
	iT8SBzycOfTuxhPuVoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvWy2-005VCi-SU; Tue, 22 Jun 2021 03:20:50 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvWxz-005VCO-Vg
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 03:20:49 +0000
Received: by mail-ed1-x52c.google.com with SMTP id m14so4983156edp.9
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 20:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ingics-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2Y3kxYWIW4quvbRBWVIa4fOTtu3njJrE0ioG5Cnm9xw=;
 b=HPi7X8T9CasaITW/jUJjxLRhkWdwkQNQrBfN1vAqPMjdru+JLx+Rw8E/JaR13H5Q67
 52bAG/0AGgve29yQcp8/F5qb3LyLfA6dC8qjBJjyCkSaEjHp0kxw51yuevwku/LYGM6K
 cV8g9Ozrwjt/G23a7G47fSoAotklzYM/A/gXtO6D79HnYznPD2yu8u7c7K0Yvcuto60B
 GT3pBa8uqSxbE/uvrYVTYZQOgMA0fgiMJwnYpDt69RPM/w+v6MiHGGmB1ByALf+yFhgX
 RW+ValM3O2h9YY7AFOLLHno/noK1vIDi4JmRiFhLo7uGd2nAEZuwUl1Ko2EbA7AxaUYp
 HTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2Y3kxYWIW4quvbRBWVIa4fOTtu3njJrE0ioG5Cnm9xw=;
 b=kUH0+XYzuplD05kTawM58vKFSEsWgZ4z0NlSbPo170Nj9SHSclqn+sWjyGwdGvt/CB
 KDR1iRJ2eWd0cvNdafMB9XV2RI+8J95ownTiPQJ+FGkqCimcaz8zLngzuc2Ya4gMgNBn
 OSD+tHc7dnlwEsq6yHLu/NAUibE+KBk1fGIsmx3VeIn3DNVAQx9GPhOqx8vUtMEsJoGT
 aDjiL3vI3A4i9k2VnvQth6egbNkaTpPClWfA4WCuho1wUeGW9qMJvlkaPjJZOOvyr90x
 IQ6zLc6NdUXA5bnhjBLYETlC6KYX16q54yQArCIaK6dekcZ40wYqaOPPMYfXh45LXxjv
 /WHA==
X-Gm-Message-State: AOAM530YZjhmMC0oImSjfl7fli1ADQujRCGiOCmWF96+k4U4pm/xqTk6
 kV7pVGv2esZLZXimJIOa3hfA3hTl09mTbRbhQSPjbQ==
X-Google-Smtp-Source: ABdhPJxexFGiesaUIzw789uWimHXBM+EirSkbrzXS9xxVRdsot99ivsgjTBpP4uF4ttrCTRKVS4osvetmloDXc3JIzw=
X-Received: by 2002:a05:6402:1a47:: with SMTP id
 bf7mr1940303edb.236.1624332044744; 
 Mon, 21 Jun 2021 20:20:44 -0700 (PDT)
MIME-Version: 1.0
From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 22 Jun 2021 11:20:08 +0800
Message-ID: <CAFRkauDjKaEmtEoUH94wkT0Xd9-XL3NOYyvB3haYVT+BrAK-Dw@mail.gmail.com>
Subject: regulator: mt6358 vdram2_idx/vsel_mask/ vsel_shift setting seems wrong
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_202048_132256_9CEAF50D 
X-CRM114-Status: UNSURE (   5.25  )
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

Hi Hsin-Hsiung,

In drivers/regulator/mt6358-regulator.c:

static const u32 vdram2_idx[] = {
        0, 12,
};

MT6358_LDO("ldo_vdram2", VDRAM2, vdram2_voltages, vdram2_idx,
           MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10, 0),

With current setting the vsel_mask does not match the vsel_shift setting
   So in set_voltage_sel, it will call regmap_update_bits with
   mask = 0x10
   val = idx << 0
   No matter idx is 0 (pvol[0]) or 12 (pvol[1]), it will clear vsel_mask bits

I don't have the datasheet to check, so please help to double check the
vdram2_idx, vsel_mask and vsel_shift settings for ldo_vdram2.
I think at least one of the settings is wrong.

Regards,
Axel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
