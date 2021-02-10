Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B03C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 16:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD6A64DF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 16:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD6A64DF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0fovThrGZFY/5sqzA0CsKkmF+LNzqbNHVdY8ePwny8g=; b=ce5LgB+SDIuYhK6OGiqjMLAFN
	JO3Z+f7Xrd3qlEDvI1QmcWG6cPSQkmyiGjrSEtI1Sr1nZYM6gQadz5bpMQnyAame0td6dQBQXM2SZ
	8boH+quUun7OBHBu2N0YrBWLOU3MG6OjHcKi8WLHQ9ikYE4amlnRHBQD18cMlQmBMEbmLupwNGqJi
	l99/o/1UuPjAwcVh+y9ASVUWjcRQoGsSE1IepVXYqh299eA52LQeC6AjwoiYHYE+gnIUwf1hkqDK9
	GAODQwNhvJxce1lYnAfONtbMzERIglDf7hECIVV7nr3cKqxFNpLgUauVjc42S6WIj5wPvbAVgy6mh
	U4YVTTwAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9seH-00036d-IV; Wed, 10 Feb 2021 16:47:29 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9seD-00035n-Tw; Wed, 10 Feb 2021 16:47:27 +0000
Received: by mail-ot1-f49.google.com with SMTP id d7so2383709otq.6;
 Wed, 10 Feb 2021 08:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=adc+2nnIR7t1ejzx3W6cWVT9M1mXeq25Jq+T/s+mbV4=;
 b=ZKhbfZzprGgRALSi3fo/Zy5gm+RmP+ab8WYNU+Jm3j5Mmrnox0CjppkyO+mN88+CKV
 /AeoC40eYX+gREwcHPxyjucYZKE+V6BLVPf/snqwuZKeTIxjTv2TrwzYDnV3+R1Fmky9
 QofXieIjI0Gr+4FYzzy5jQ0E4UES462ZVn9ZepY/SHBYcWpkKuaZhZ08BCo8EwgV4SSx
 A1EfGTvKQ0U6f6ilfRmZxNLdSSBU/Vvr7A5m/CarI5nATqotMUOlguRpYbEIsY4RHAly
 u/0ht2QwtGmlxTPDvWRCEl6oouH3oB9XKzZErNnHU1egK6UXPVmDzJpkjHKe5bzzY8oL
 i7dg==
X-Gm-Message-State: AOAM531YN7xie3dVCCXZtFUG79k7v4ztW2qEXvzxyVcVuBUuJkOhww7V
 lWLyXclCZ/QajtKPKFXcEz3Zf4n+Gg==
X-Google-Smtp-Source: ABdhPJzDBx6iO9hFxjii9+Tc5ZPdKtL7/LaOdiPcwmllkri6r4LtMp26ANi5eTLgATXAnBb8PjSItg==
X-Received: by 2002:a9d:2277:: with SMTP id o110mr2841529ota.30.1612975644823; 
 Wed, 10 Feb 2021 08:47:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g11sm567977oif.9.2021.02.10.08.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:47:23 -0800 (PST)
Received: (nullmailer pid 2308105 invoked by uid 1000);
 Wed, 10 Feb 2021 16:47:22 -0000
Date: Wed, 10 Feb 2021 10:47:22 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: spmi: modify the constraint
 'maxItems' to 'minItems'
Message-ID: <20210210164722.GA2308044@robh.at.kernel.org>
References: <1612675154-2747-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1612675154-2747-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612675154-2747-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_114726_065969_FFE42F57 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 07 Feb 2021 13:19:11 +0800, Hsin-Hsiung Wang wrote:
> The constraint of 'maxItem: 1' might be larger than 1, so we modify it
> to 'minItem: 1'.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v5:
> - update the constraint of minItem to 1.
> ---
>  Documentation/devicetree/bindings/spmi/spmi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
