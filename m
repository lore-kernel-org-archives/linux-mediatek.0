Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596D0C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8qgtbyQ2Sb8S21ck6j2VRxOU1twEycLNKRZP70WuG8=; b=GI14kUd5KOi/HonlE7sUVPa0kb
	vYu/eLnaho8ZjFPTmBO30+KsQHbxXCgWhX3B2Zf80tvWLcyjZP/zGiGKFodhlAisV+j6hGerBNjr4
	fNhhoPwbfmyCRrgMTxQFh0szgCXqxWGQh857/Xc+6kkitxn9JCOmKAIwOHDmRlEKTMuwrBb65SF8R
	0Q32tOPJOkWs6aEjyW5pCPIiNWNQYZC0D01Yk+pwycIKqH9DDE+tf1EYefJ2o/VAdwYEpzB98gZJP
	prNioYYx635tMz6ZWxz7BS52AvpoZXX+P6CGbI4tbeeudhJukvQ/azAXQ96dJuw/LOgkeIaHc4GPh
	NWGYPqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0vi-00FeOr-E3; Mon, 25 Jul 2022 16:27:38 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0vf-00FeMf-PO
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 16:27:37 +0000
Received: by mail-lf1-x12c.google.com with SMTP id t1so18837105lft.8
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a8qgtbyQ2Sb8S21ck6j2VRxOU1twEycLNKRZP70WuG8=;
        b=JhtERbfmoVEvbWgiY8SuIKSc43gL6rNbUppkuVwEQjXZ7KDlqomb8akiU6M2py8RTh
         keUK/ttlR+gj+ew2QoYldWSiuXopIcE/oY59thxBNiu/vKCNmTI5pkBA6aUxm0JvvtZs
         EWk6+6iE69emTjZlUTZVBBUT6GGPlbLXxMOdC4fVgwvNEVHT+aTPHkEW2ml53r83EjNF
         T3MPNymLb/VEkNNYNEQTgwkzJNNQUjv+eLPIgdWjiB2MkfAnTeC8T3FNKyHLf650xZ4D
         o/MUc/NqZFExoNlA6RAU580SH47kbJCqeIGSclpIxzWWEdLxso9AoRG0exMZkwW8BGXq
         VzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a8qgtbyQ2Sb8S21ck6j2VRxOU1twEycLNKRZP70WuG8=;
        b=2ddWuWupGbg+zQ+MLl3H4O3YNcH3SqK+COPDv9YUK3tJ7zk0WOItxsziLtv4zg0uRe
         W7803Z1QMkVt4HakP5WqxV+w7S3KKk9EH5swwe1ayEQCYJiIzvGsL6pE/xA5dfjorRTx
         v0H6dr4VYqwsEI3pMSHs62dcWrS5ISn7lXJdj9vbGEBFbyDjsPy9laB3v9ArHK4G9QGb
         mpy0AqLBHEtNdgkZ8TtHfkuGhk0AikHkfNQttVWoJPD0vj5zpbVbM5QJKOtBPIGTrriw
         D5SSC49eiAfOUuqoKpHJR5ne8nV/ko3qf/dvXfH+UcpiD2RVJzs57133l66SuzwvMn+/
         /2Yw==
X-Gm-Message-State: AJIora+BkftbqTWj62FlscGT6y8UlOwfL5l2mPEggw49TjEd8zvjncC3
	1m51RZYbGo4T8sClf8NLTwlmoQ==
X-Google-Smtp-Source: AGRyM1ukQToOk9Zpdc37MBg/4uZr4idwBKkMofuxwfvIVe/VMLESuNHBmYViO8Fap4CebE5hIwIXsg==
X-Received: by 2002:a05:6512:693:b0:48a:7c23:1896 with SMTP id t19-20020a056512069300b0048a7c231896mr5121392lfe.111.1658766449738;
        Mon, 25 Jul 2022 09:27:29 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f6-20020a05651c02c600b0025a724f2935sm2812818ljo.137.2022.07.25.09.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:27:29 -0700 (PDT)
Message-ID: <a1ecd715-4f74-640c-09d6-5b74e026ecb0@linaro.org>
Date: Mon, 25 Jul 2022 18:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 4/8] dt-bindings: clock: mediatek: Add clock driver
 bindings for MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, y.oudjana@protonmail.com, jason-jh.lin@mediatek.com,
 ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
 tinghan.shen@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
 sam.shih@mediatek.com, wenst@chromium.org, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, kernel@collabora.com
References: <20220722090609.52364-1-angelogioacchino.delregno@collabora.com>
 <20220722090609.52364-5-angelogioacchino.delregno@collabora.com>
 <8d656940-567f-d8ea-8cb1-4ca37dde3e0c@linaro.org>
 <6d6d05cf-9c56-a29a-64cd-1de62c530167@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6d6d05cf-9c56-a29a-64cd-1de62c530167@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_092735_854238_5BA7174C 
X-CRM114-Status: UNSURE (   8.57  )
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

On 25/07/2022 10:13, AngeloGioacchino Del Regno wrote:
> I'm sorry, yes I got Rob's review tag in v5 and I somehow forgot to add
> it to v6 :-(
> 
> Should I send a v7 for adding back the tag?

Yes, because otherwise it will pop-up at Rob's patchwork for a review.


Best regards,
Krzysztof

