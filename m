Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B464C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 22:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20JPoLEB4FLrx0W5TrLjMYeKtEV1V0UpKoF08bftQLA=; b=1LyjIzHyxol2KocMFssI242K7Y
	kQAMCIf38r6WMnhI8ojYVAnSAbyjgBpG3WX7rSBXKsdXyz3dMrMq1kPTXnCMguJtd/degzebm0F1K
	RYve17MIabyVQxKKGZJqQA98TkFN1uo7aJEmpdLj8gvjoc3Hff/TJYt+TiJ9YNH7Tma8pdEsTLcJz
	SHe1zB8KcWjN+kvkcqtihlvvXk2+vCXx8gVgUa09rl9buMrGpDiG2XVLAa+D/Nimb2yzRK2/DWS94
	4tkzeOg0AbEA+wsG0J1e5/OokfhgFC7lw8nUKg57bcOHeerkioE28quDIeIyEJop5KAX/NFit/lEH
	EKDdouxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F98-00Bd9q-8l; Tue, 14 Jun 2022 22:36:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F94-00Bd6P-UG; Tue, 14 Jun 2022 22:36:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id o6so8929037plg.2;
        Tue, 14 Jun 2022 15:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iCRqf9cUXGD/wTCU/6Imd8qKcHz2+4H04fjUrasRl3Q=;
        b=dXr0HBARH/IhMAQCJKv5GP/8b08Y0SB7y9aFtTCe0fb0G4y30PWyglmseb299ngDiM
         cnPWKX3tO0YN+LEizKNUAb6YLg9u+Q8jugjiTinGo/NJLmDrHvK8GCygJq7qXH5iOh6/
         ALPNLJHtx9F7bAhO7wEAFYtfZPsJueJFS6cSyORBByLqe6oRMZCEl2xi0gqN3MpzjIN8
         SnKU+eLAEj+x4Q1otFcVNWBcN9/71rA6cWzQp4uDerRoYDbPjyblGJ18SCZvoT/HoXHQ
         Gdq+atH6IeNhy9ngEyOpbc1Q4CEfYaYIbXc/yx/ZBhJBHF7uyIO7zHSOb39Xt6/cLL4C
         ezIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iCRqf9cUXGD/wTCU/6Imd8qKcHz2+4H04fjUrasRl3Q=;
        b=j9BF3dQVK77xrnNZJytQlELnpZqJBhhGdFuNtDLrTZDz9eDne9oIKxIK68mWKVAl4R
         SIMboEk5+RMtFjqp4bsKWiCEFEgslad7POV85ZHxaCf90heFGTx8KOnMSLegl62/yXNi
         RAgOXCMbCJ4/cOvZjpmOzX3W6AXbBTsVdjqDOs0D9wvgwIWWYkUA3Kc8EJkZP/WJincs
         7bhtwY4w8h0RBl8q9XQKbUPpiY2x/LxO6w1YNyZyU/890RwVfSEBZthwWQ6Xb++abJZB
         cK6PyytKwdqUyQO7ql9vA4FObKdQGf38pbFaqEhczyi3hM0Ij2/XG7hSF73QrDdR9r9l
         37HQ==
X-Gm-Message-State: AJIora9VxXtyVCMr+1Ld/yl9ibdfUFEYsOu/Y+JAri3cnISlMfCfuupV
	iGPd3bPA8YDGzp3UHyMTjV7408YnrPY=
X-Google-Smtp-Source: AGRyM1veauvE5xHkBIG4jYd5/lRRAunReUDsP8s8Jdo6vfU1q8m9/D0HJO7/fGHR1qQFm6XVLzYNJg==
X-Received: by 2002:a17:902:d143:b0:168:d336:9de6 with SMTP id t3-20020a170902d14300b00168d3369de6mr6292271plt.124.1655246179952;
        Tue, 14 Jun 2022 15:36:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t20-20020a17090a951400b001d903861194sm105946pjo.30.2022.06.14.15.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 15:36:19 -0700 (PDT)
Message-ID: <21d78f56-77de-ba37-9e07-fabcc2f22e6d@gmail.com>
Date: Tue, 14 Jun 2022 15:36:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 4/6] net: dsa: mt7530: get cpu-port via dp->cpu_dp
 instead of constant
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220610170541.8643-1-linux@fw-web.de>
 <20220610170541.8643-5-linux@fw-web.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220610170541.8643-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_153622_982849_3FF3F1DC 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/10/22 10:05, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Replace last occurences of hardcoded cpu-port by cpu_dp member of
> dsa_port struct.
> 
> Now the constant can be dropped.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
