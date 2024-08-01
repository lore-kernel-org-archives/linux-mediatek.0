Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9794AC3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2cI0IRI5OGY+h9fYtpnfrfm65dWiFQL1xXhvgjuX7h0=; b=hH0/tupMtDo4vdaOQUyu+RH9ii
	06J6GzDvP0ler29/Yp+DcHa7cD30fdChRNzMbR8EeRGl5AD0VWg1dmxFq1skoP3oOuOldcOyc25nR
	F/iHIwkB5NzzVLvoNjYW39sdfXeAp1/qj3SUthJegDjRbtXy0P2gJTlCEw7nz4uWUmiJK9u1XQjOS
	MfhbV+kMAYw884/3f3ttpQ0VaJfQkiVdVKWaQcl8nJNmtKixghGjRaMkzQ/0rHE0Hiw9OLc+AABwW
	vYLBBU7d2QaGsNCJpbK1o46JI+wyPHtqKoZbPEGHYZFM2K2N8U6kfT13LDZEr4As6XEGWByLcLRqM
	WNU7whMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaRg-00000006NF5-1D1k;
	Thu, 01 Aug 2024 18:22:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaRA-00000006N8y-3qeh;
	Thu, 01 Aug 2024 18:22:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fc4fccdd78so55255295ad.2;
        Thu, 01 Aug 2024 11:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722536524; x=1723141324; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cI0IRI5OGY+h9fYtpnfrfm65dWiFQL1xXhvgjuX7h0=;
        b=Tvx6wrL2x8MBcTh1ys861sy5DDaSiBy7TqXW9P1w9vhq8hQvtmo9578/KBxJzZDNQ4
         F77G7yJpbQBCJCHFljl7c82ad5zU2+iyyOHIsar3D8jUC9Ie3dYrckubxs6fC8EF/A+l
         NyvgWau4Iwemt5TTl8jq+wAqQzMQxIWDNvdhnCnCGIXxj5FZU+4F9r6m7+DQL+yCe1FH
         ByO5WQhNm6EJobjxAl5ZlxvBIq9eshQJQpw5p1TZ7veBX3Wn1W9VCC6wc/orSn9Gn7WJ
         iuE6N2kuJlmx+/n08HWdHqdP+pgv1vr0K/t+CKVYW/CpoMlkxjNFEGHuUd1LG5bwDPyY
         qlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722536524; x=1723141324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2cI0IRI5OGY+h9fYtpnfrfm65dWiFQL1xXhvgjuX7h0=;
        b=VISX2+IQJ+sEKVyix7UeZmbFNHnSRDra+0P5EkiX0VBxS4ejE2rXiRpLFJNHgvpwAy
         8Wl70qbVQ2GIST4Y3nxV1HEJZyUMvnrmUtBQ9xd8VP3nPlaExrjYi2QFr/AKIIWENwS5
         29CYtpGS3PTL1mAl8x3J3+/s5GKBIwk94CZqZ0ZCEPrAYlYcHkkUML7lc9FGrkuOonJN
         cD9iJLBoZMAsJXoZGB/wIh976rFOAJ0fWTuaH3uA/1YF97TvkMU95UA5/mU3AN/P6TGo
         5KbKRRmVtFwr6S5cwLAXChaTcxL9gzLJM37txfnAV0dl0Pr8F5ds5DdTasiPSQPwdxXt
         ZVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzTv+l95cNjn++cpTGx9Fbn77uufjUQKhJC9oe3HpekZCqakEyuta2fqDeuMTCItpK0/TG0YwpX0tneO2eCurFBYfsAPXWSK3vxSG+QM/snbhsKIeTh+czyttSc0QkArJ20fLFYSsokhvXVoZ3q/LMWkwyUdPGTfY=
X-Gm-Message-State: AOJu0YzWF/qQsU3jcRJso9t0dgTWDha6md194JgjojSRlSJ0gO3fdkbY
	bD9Gq/ek9u/AQAAzWqTVmXyL9gDQncztdKB17zm9IAphzfQJtydm
X-Google-Smtp-Source: AGHT+IHPdcLQgJqPAa2E5MFEcxR8W+bsd27wDrycSJcZ/aF9f5pWPqenwUKiYiGAMiS/xP62uWP3pA==
X-Received: by 2002:a17:902:f9c7:b0:1fb:6a96:fc6b with SMTP id d9443c01a7336-1ff5748d0dcmr9205075ad.44.1722536524110;
        Thu, 01 Aug 2024 11:22:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1ff5928ff1esm1822205ad.237.2024.08.01.11.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 11:22:03 -0700 (PDT)
Message-ID: <72bea681-b2a5-4246-b2e4-d431a63338dc@gmail.com>
Date: Thu, 1 Aug 2024 11:21:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 2/2] net: dsa: mt7530: Add EN7581 support
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: arinc.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, upstream@airoha.com
References: <cover.1722496682.git.lorenzo@kernel.org>
 <a34c8e7f58927ac09f08d781e23edc06380a63a2.1722496682.git.lorenzo@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <a34c8e7f58927ac09f08d781e23edc06380a63a2.1722496682.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_112204_994986_2C0D6454 
X-CRM114-Status: UNSURE (   8.34  )
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

On 8/1/24 00:35, Lorenzo Bianconi wrote:
> Introduce support for the DSA built-in switch available on the EN7581
> development board. EN7581 support is similar to MT7988 one except
> it requires to set MT7530_FORCE_MODE bit in MT753X_PMCR_P register
> for on cpu port.
> 
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


