Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2C5D3DEA9
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 19:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCWiI7Mk5Pc1ToBG0yRJeA7emmBaVqdcvJdezV41wZ8=; b=Wwx02yUPws3456jcaJS6pIUU7Q
	wP064eswOzR0fO/DpL68IWfokbASkfjkcD+PtW2O4I4fwB+JMED3qrS4eZKkH5HEShCjdB5lQemgo
	WD5Gaju6OMMEpQb7akmGiB1kJCumnhX6EXOZl/QtLzOXmv9hu3FNN3sYKUQOnRTVTA1Ls61kIzZ8U
	Cjv439oF7gsndsKoh9rj5yZGJII+xaj1vqgyi7AyzE2RV22mcsW4u1f5kc/MGPWUfiYYTn7DJBTNv
	qfHnQFeG9XLD3fd3C2oirVgo0u5pEFsWXDqLK7+ZfaAS8/wggh5X42pzugLqJeV1qMTh9L8Jb/PDQ
	TEb2a6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1sNC-00000001kvx-3PQP;
	Fri, 18 Oct 2024 19:10:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1sLh-00000001kdB-2ZUU;
	Fri, 18 Oct 2024 19:09:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20e576dbc42so12774535ad.0;
        Fri, 18 Oct 2024 12:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278560; x=1729883360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tCWiI7Mk5Pc1ToBG0yRJeA7emmBaVqdcvJdezV41wZ8=;
        b=S+KEuc/9pRh+dfE+/dONqvoiBQng7zUOLtbub8pkmi0QHDMznvridziDU2UzxTygu4
         xO31yOLfhF7YTdimL7XVfAQxuYozi8WXq2mTwaSpKfO9BwC+TIRJUwio93l6vkItpIN8
         6xZLpdtneVIqOTqcVQoqi4JSDgAhcWSgDZurjg/sUhbYPwAYZD2C7WS0Zp05BIG2S+8t
         74808pJ3uDmb2U5tSbtJoCIu8U2sRH7EuTK/ng12pR4RFkxVx6kcrxXrXiioBBtqy1mw
         CXoomerUXIYO+Xcec0xIcna0bfZW+gj4lR2NRZZaNJw7fB6R9v8ym428slA97rbd50xs
         q02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278560; x=1729883360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCWiI7Mk5Pc1ToBG0yRJeA7emmBaVqdcvJdezV41wZ8=;
        b=LY2wPFJZJl5cs9nHN12WtTHwkSvCGp54dpZm0Kt0HRa6fzs5RcIdMj3Grq78Tuoj0k
         E5+F7lxMoDCxJQ+HsL9HL7xFIjQQoTGiKG24P4pDZ4b9OoH603ffwuT8F5g/Y4bf9hIf
         6OcOACyoEeeVYnWmQfZ5pbyPYtH47xgge3tkRBoPR7jMlIolLJgnlU9YuiwUD56cv50D
         yhrioyeJ14KIQStXNnCE94Tj1Ce1eBE7uT4hg3LB38zfL6f5z54Uwu8WimzzlmUWBVn4
         X/vZd5Tr3YSUufVAxKKhXPVCuFmr/sMry86KuecVOX2hY1lSOjOhx/S2pUGPxHDFNZ0e
         6GcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTlFPZE4e0cWRo+oGyHKt1xSLX6omMDC5DrtGs3o6WbOEztW4mdgJ6JsdwVGEhtnHFI6PRecxakkhWZ5QGIBY=@lists.infradead.org, AJvYcCXKbew1FxuoUWFevSj6aAWpfj+yVDrM/P5Sv5bgIoZTnvzjQsYqtx88gt4wmce/8JkAtskcM/YuNsPJkdy9K9we@lists.infradead.org
X-Gm-Message-State: AOJu0YydS1RHNFJGd8PSFvaCF5WE0dug/3lGKNmIkdYTAGfzxO8Iv+7q
	0VO/TCeqYT3wrttFaeiELQ/vpJGJvwJxGZusdhxi42DMqp+YEDEs
X-Google-Smtp-Source: AGHT+IEruX+cxyVH+gwEEsGDweblTcIgnGhNv3IgeQH5Htuac5wGmq7mHQTOxWYmy6TV37BjA3ZgmQ==
X-Received: by 2002:a17:902:c94e:b0:20c:dd71:c94f with SMTP id d9443c01a7336-20e5a95110fmr44504275ad.41.1729278560033;
        Fri, 18 Oct 2024 12:09:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a71eae8sm16052525ad.45.2024.10.18.12.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:09:19 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:09:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/6] Input: mtk-pmic-keys - Add support for MT6328
Message-ID: <ZxKyXFZFFNwD6Tsg@google.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
 <20241018081050.23592-7-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018081050.23592-7-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_120921_685438_2F2510EB 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, Oct 18, 2024 at 11:10:48AM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a compatible string and related data for the PMIC keys on the
> MT6328 PMIC.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Feel free to merge with the rest of the patches.

Thanks.

-- 
Dmitry

