Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2F2C4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsRZs51W2huLngb3aSHYllyqQl8VP5fXmWHfrrQr+1k=; b=2kdDBUyrnYoLdt
	4nn6lzm5Fjly0PUEA6NOvuRVAFcknc4if/d6d1iUzNOYoB56UCLeQ6wegO8NPsZd9VfpAApPncleY
	ICPRLgrmXBlCHiwGTyaMZwOHCzt9Ko/u5jV37v1kg0vzafFcHZQ99EBejh553C8uWev7zF02uRAeM
	Sq9Y0HrMg7SbLnpBgjuZKnNzjpJKsUTY84d4NB+PBgatDEo1plkwvqfHU9JCZe1CdrqBl1eynxTVA
	0M/nagWBBJ3+eiH4uYtWHI5pnB50o1upHYsV5kMePDLxknx+ANg0RO7HJuHbEJnTOy5hEk3aao6Pu
	D9ISK4ProcbuU0//c3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXeeB-0000000AGnV-4AHJ;
	Wed, 07 Feb 2024 09:55:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXee9-0000000AGlr-129H
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 09:55:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40fe79f1aaaso3481235e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 01:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707299710; x=1707904510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsRZs51W2huLngb3aSHYllyqQl8VP5fXmWHfrrQr+1k=;
        b=YCrhVCJppe2nMPq6pT6UOT5LIQ1gbi93gGPTafQs3oPo59R4wFb5qeMAxUwjAGOjo7
         rJhKYJWcXO4pKhLPw8HLEdhn25VKnr6H+tQRvClS53I6DzCwZvn9D9+xqfpPWeJWMf8j
         Sp1wWYvx7nnwo/raCjNHby6HFwBxuD9myYFVMYcQ7F+qUgbhcQSH3HqVor8Jw5C0PBeN
         DNvUpAmPSyGWtTUQGuwAS6HYoBZ9KHRzzhoNYj4ZdZERJHplp/caETtHo5kdVddUqZHQ
         qQNIm6TjdOp/mfBX8jyt1VMZZHR2HcGbwFYSVNDB/xXcSNxw5pZ0L77QhYzufkuesQs+
         EagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299710; x=1707904510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsRZs51W2huLngb3aSHYllyqQl8VP5fXmWHfrrQr+1k=;
        b=EUG9YKrMBd3BbTnVpdNAoCEO/Lb2ezILXMwFduOwCVUkCQXfVm++3HPePXd2x6EYts
         +UWsnEYPwZks+rwnmyGzwCuCu1qhLZSKsoLq8uvqbuiVoWehKxElJtlEByqJWG8G/+0H
         GlJ5ixBFvmBUXqoqK1F2228TVgad+UOdpX9xh8XNNV5AhC8OR/n+TeZYnkIW/polk0lZ
         YRoMRNMknHY92iIE+6h6A/ce+0Wv4KbO1pShB6ebC46oMfG9oMVS5y+USML/hpSYoP6m
         m4WMQO9oDQkjErfD41tMgfGvNJYVEU9bGycEitaJH3sWZIGMSl+AR/vQ/U91DkANdzlj
         /KQw==
X-Gm-Message-State: AOJu0YyZTataeocGLBCB4tU4iVbbxg4o4wzN1FvFume1qWf3bxo04t9W
	+jFlOqtac0vpcwi48EGkD9ksFnlFqYKSBNs24nVJ3/NDyzKKyHMPjr5IkJ+zldQ=
X-Google-Smtp-Source: AGHT+IG7N3OfmAh54zPppxgxnipuAkjejir3UBYj6pe+R+53DlWxcD0lVN8Xy4HfG00GDYpT1e67lg==
X-Received: by 2002:adf:ce8c:0:b0:33b:136a:95a3 with SMTP id r12-20020adfce8c000000b0033b136a95a3mr2875503wrn.28.1707299709759;
        Wed, 07 Feb 2024 01:55:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWomvasDY2y1JGYC41yi3XjKUcCAy+WjDD4t4v3x0Py0iVpS7KfDv1ihzcoSIGyJDs9LYYnSaZ9fVzQIbMxYSQddfp8BcaLQPOmNuHTxP0Iq3nKxKzxCYdg5Amf2xeEnKy64aN9m8kBu/Y+G8fqpLaCgUrbByqQO5y14+C2vcwkn906lbapgjN3P9YUIbT0CwDgRn4OxG9kOMqi2wJLn5digJZ2gLiWgHsG+LSTfjqwUg32N2xvJHUSKhjyYbeycS6tsV13hPkwZlniyYYpr+1XW9zDtc2Jk6XvtZUPvYjgT1Ovve5EMo9BDAjQT2jSLISuzRUJ/qWitiGBJqvLZXczHzEPtiShAn8QqCcU56rFp3agu6i3oSNL9XqzAS1I2ntzuQAt078dz8WPVcmbJz8L2srFCMgE2eVFDg==
Received: from [10.101.1.8] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d4dc7000000b0033b51e2b9b8sm23808wru.23.2024.02.07.01.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 01:55:09 -0800 (PST)
Message-ID: <843e34a5-f175-4bda-a2f1-2ea3b56b68f5@baylibre.com>
Date: Wed, 7 Feb 2024 10:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
 <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
 <c1e2c380-21b5-47c1-b83b-f7f2b481df21@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c1e2c380-21b5-47c1-b83b-f7f2b481df21@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_015513_308991_DDC16F36 
X-CRM114-Status: UNSURE (   6.40  )
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
Cc: p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/02/2024 16:53, AngeloGioacchino Del Regno wrote:
>>>   #define DSI_PSCTRL        0x1c
>>> -#define DSI_PS_WC            0x3fff
>>> -#define DSI_PS_SEL            (3 << 16)
>>> +#define DSI_PS_WC            GENMASK(14, 0)
>>> +#define DSI_PS_SEL            GENMASK(19, 16)
>>
>> 0011 0000 0000 0000 0000 => GENMASK(17, 16)
> 
> Alexandre, the reason for that is in the commit description :-P
> 
> "While at it, also fix the DSI_PS_SEL mask to include all bits instead
> of just a subset of them."

Oh sorry...

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

