Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE5AC77B62
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O026JM7eSnBPLdKfSjDDMSv0KRDXdafHprAvA88P84=; b=TPbGMDzDKPolRgiAm/MflkgMA3
	RvWB36wWvXklq7OLlQhNrdLp7FHHsLn9uLcU2N5uDbdhqWeywCi7mG7rsurSO1XRnHuDqzlbPU6o4
	eeBaG9f+igmqWcPhiBdKa7F/kIbHY9efYjhrMO6mvEtkucUIF22/WHZ/GA/saVbJSfhT9s6YkLvpb
	ZoYLirqu9JH9X8yMa/oXugEvsABJgT+8UajNEiF4ULiHiAgJ7XS9ccad2+I/9FLc5Q6bC+X05LtOV
	WxmWtkN0i/pNkuC+Lhm/ftzXkG9tngfZrqQldGSDSeYfZiZrzgl0atA2t5uvbx2kPSXQJ4lKWti01
	iLiv/fbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiLf-001wmV-1W;
	Tue, 04 Apr 2023 15:13:27 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjiLa-001wkv-30
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 15:13:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id i5so132215482eda.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680621200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O026JM7eSnBPLdKfSjDDMSv0KRDXdafHprAvA88P84=;
        b=a7XqBTQ0njpuHJTWVmYyEC0Lv+fIrzGPXujd5UcPSChN6qIDSY9Jqt4zRb8rev/rXC
         Xez0vM/KcaUGauqdeEAFCAr96+GdSTuEPVqUTCE8fm7RElbd1umLDEIipv1bvHHxcX1L
         w44Gumgw2WN+z9tIa926gMWQhN1bLpqXeNcME5O+dZpeC9RvsDL4O+Vb7jP3uSBjhQsS
         7CCERz6rXrnuLEp+krtmYlzeNA2oOidFFmqf38BK6e2FKyWuyKwzHXJNQ3C56iZzptbq
         XfIEv5ZzhrnS4UtBLJTsvYMe+2jzyUROAuq7W6QRJXZ8Ga5aAwYb7RToh7l9FRRbzhkY
         mJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680621200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1O026JM7eSnBPLdKfSjDDMSv0KRDXdafHprAvA88P84=;
        b=jpUvu6ogqqfHEIPYe2JkMoAHZITMnmJBivGriLMVYyoOsGkU+3dVP4JumWu70RrEe1
         LR94X+JT4olqNICrJNnlgdxjWwKUfLz7sqO42fCVX9cRn3ApTdQ+BljyJ/g3zaTq2bEv
         BermRUxtBEgbQcMRyaN3JGsVgLPbogyjk4kv7rVXGrDVj1hpcl4tsOttmjFH0W+aNapG
         XfXZuthCz3GSNI7GooB76b7W6U2f/G2mq1zpczL31+cqm4/AxjrP4aG4fpZ/W4es32JE
         z+v+QGA3jS7AJXeWjT+Qs4iCMVVCXNvN+90in8+O/3wCQvS5r2p4KP6Y6ILND44GijX5
         2slQ==
X-Gm-Message-State: AAQBX9flcvw9I0+XsKDbdFdnGNw9ItYRQypHEwbbLxMNOWhxc05hTnlr
	NkeRs6iger5thXIlL+0M+MqgphFXWPRH5R4RD9yoYg==
X-Google-Smtp-Source: AKy350Z9lA8DgGqhAjKhVYJznsekz+CaWqLxDEEDb8hlazRI26y2fGS7u7PE8AETVfvb5fn8k4nKYSUUTLHi9KvEap4=
X-Received: by 2002:a17:906:a5a:b0:946:a095:b314 with SMTP id
 x26-20020a1709060a5a00b00946a095b314mr1387289ejf.2.1680621200196; Tue, 04 Apr
 2023 08:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230307154524.118541-1-bchihi@baylibre.com> <20230307154524.118541-3-bchihi@baylibre.com>
 <0a86d734-000e-560b-8f47-1c0a113c01ee@linaro.org>
In-Reply-To: <0a86d734-000e-560b-8f47-1c0a113c01ee@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 4 Apr 2023 17:12:44 +0200
Message-ID: <CAGuA+ooYbHn-4BYzaTkdagc2FimkenE0z2Zt4AqDbXQ++GThvQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] thermal/drivers/mediatek/lvts_thermal: Add AP domain
 for mt8195
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: angelogioacchino.delregno@collabora.com, rafael@kernel.org, 
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org, 
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	khilman@baylibre.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_081322_967266_E567609A 
X-CRM114-Status: UNSURE (   9.67  )
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

On Sat, Apr 1, 2023 at 10:51=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 07/03/2023 16:45, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add MT8195 AP Domain support to LVTS Driver.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
>
> Applied, thanks
>
> Changed the commit log to reflect the comments change

Thank you Daniel!

>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>

