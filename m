Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20BAC55174
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2026 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=; b=qvqbzI9ly4Sxy0xbWXMZgg0kgi
	bvjUV/OuagsenrZewNTqdMiPVnGdWnEB2L5lFchwNCP3XwaIKQm5jZCJVoFzwRJGgNYHpDUhz2CGz
	oTlayWQGcC9YGk0dnt9ZUD4XFD71mUaXFdzK4Q0u/h/5w5NaxHK3yyRKEctHvgqXhR4x9t9TTM9L1
	BzA9e1BFvgrzko7+OqhVYkP6AI3rUNHTyCbpqD7nBxvy83XHOeOfnxVrPNdEyhsqVwLeE/MW5btt/
	pDj4rHCNM/aBhGdFrcfb1AuvxCTYh5BHutilRhASisyAJjIfXab09kAsVIorQt3Dcu+FoFmB6PORG
	w+1MYvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscub-00000009BvZ-0FhT;
	Sat, 08 Aug 2026 09:00:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wscuZ-00000009BuP-0OaT
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Aug 2026 09:00:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso276344b3a.1
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Aug 2026 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786179610; cv=none;
        d=google.com; s=arc-20260327;
        b=DhIDoCTmjA+0BGz57LmZxs0e/oF+J9i6x8fMYD3GpfGZtbyfp46CojvAbcmUXogJpX
         4v8ndwX97dGP2X8Qweb4D+ehnGg9wdjifbx0V+TxR87KINd6FeXEdhNlrQPrUV51LfLu
         a1jjFjIyJ+8ZFLumUcudDFtRaLOrpOtVrg+lV/3ajb222TfvGFd/NVL0NyKIHnqJhHhv
         6hpFdvgM8ug74pUE0x+tJGf0quZRzD4iMnvPAtYc5aufDbbfl0lK/7fA90oR5AdqIDqN
         UfH6MsCdP1861ubXsD233VkTp5ifCZhHYgtPdJxF/dVgi4rQzeMvYLo4SYmGK7zfz4+6
         o9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        fh=gjrlKnXGxTHsjyVqF989C2VPZ9C+Pg7VUUs4Xz7F/3Y=;
        b=A2kXrCInGJeyft2gMM54Pcp85rUMsEHN/ao72SwUEPj/ycqb1EscuzreTz53slIuQ+
         9SgBiX+c4fFLiFYCnM+M3xx7PK206bfkYUvI6aPTpTRAoQpClNsjUiOhuh2PT5IGk7nP
         G3xChLEvhCC5AH7Gro4rNDsg9OIWz7W2F1O08eDJWzcqevuWEkpin/Av2nbS78nxR3XI
         3nzTKQ48H3zC+KiDCD/4nL79aKORvVBKBmBxu7nEEUb3y2yljQlnHXMPep/Q8SQGuLeP
         b7M4fH5HIFlAr1ZQlYBbjkDgCG24Po6zIgPI5cMxCSJoVvEoRuwiDoWXB4vLU6tt+Aa+
         RG8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786179610; x=1786784410; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        b=eMRZr2ACi2gj81Hw7hJaLenrbcAHCu1QY4t9kBsaMLIFCquW1LOH7i6fuuupVFidQ4
         aeZFTkTAdmxlkMMw+HnECsnqbu9rtuI8nsukHaQJI+WE5XRozI3Ax3hMhRl1nqD9Jvz/
         5pelILiZ58bc3D4Xv+bkWTj6dG7ZxPyXz3rSiCiHvgpwA/wznT+4rrx8j5btlsZ4Cq4k
         xJzOpJatu8fED9uQ0gR0VM1fgvTPW5LS0qV7tpaIlceOQe/eVTT/9dbxKW3sPLUmK2hV
         8LEb4a98S8ijC5os2VXD4ziYQsqgETWIFkhkuiB50gXKVbB/2Z9+VSfQ8FXhajDh9RZL
         +dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786179610; x=1786784410;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ttb+o5p7BZaAI5tLlxIO8Vba8Yks4awltsT919HRAqY=;
        b=WF+/ElcYFOV9uUkCnSVz+dkUATMRqDYwq+jm8kXsftTvS4TnlrGX/83XQWpBEAZKdD
         DPtJ2mCBXYiKQq4Qnt6QdPExeNz0EDd8Qx8DwzxuznlZZpkhX+6R+YcXa+JR+P/iBU7N
         Xi6Q7W1ejcL9I6hgMb3LlCQr8i6odsRDImQ7NuD2I1PjynsMNBDScAOVteUw5aaqZwdn
         jCW36xZ3GS/1osqfsXd9bGwExgHA1SAmJwxd6cNWyAv+RQB78HY/yS8Qe4r+ciKg8CMn
         9O+3vXGowaZxcj/4W5gbRGSMjRTSpDmZrUjUJeRqmmowL5uRC7dBKdwbiLc9ABrVMyRa
         CoAA==
X-Forwarded-Encrypted: i=1; AHgh+RovBySEcAV3sPNVQfEYsfI73cVBWV2o8iqvPekvyaZSZELiYEpnqpc+UGgqYPAq4KRAPtUb71AKI3Ki5XGD9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkZLjxYwBAqGViJ8fiTZiFvzx07OJsGp7Cr0EwrsyV5iPptEvM
	ThJhtUFsmDFFAn/s8VOp616MYaZuCS4w7P7GG970WtM44/5iymqnLEfcfKt0HeMGBxsBC64KIL4
	182eocCATv1Ed7O59pf7qft6ucIjHHBlFCveX
X-Gm-Gg: AR+sD10mlee6MPWOqvtygLAY5CYJQqpOO+RX/UstbDwYZS/xaIlHDtB32duh4mx/cFD
	qvDnoUyRnScT1RgWeG92LJB/L1vM+RkQFybd0wjt9bOpS6u5ieyeZcoo8bBDE4DZ1hkaL856cVR
	gD7nuIcDC1SCA0Z7bNKMcVGRG21dhITOwc2CZXN7WAmWLnpLn/lLMzoK7MzNHVRqOs+xGGkUfQv
	7mpIkiNW7mx9L5O9C5FMts4JidnkxIzm5YZjqJ8db1QL4pf17HT8O7eiblpJdvnIGi7IeaM6sue
	uKXMryDV+GZU4eoL7j5oszBwafTmGhfaud6pw3dye4Vhb91fHsvzoOTB3NVRQjZTf+/epgLm3gR
	W6jHV3mFFaqQHiH33xv6LN2c6bd6nR9lJ7LuRh9dpJJsB5+XI50Q+Eh9IJk/1u2d/CyuUtxu/zX
	TWHC2mkmO/4KsT/TQ=
X-Received: by 2002:a05:6a00:4c98:b0:847:e2e4:a36b with SMTP id
 d2e1a72fcca58-84f6b879bdcmr4679831b3a.19.1786179609674; Sat, 08 Aug 2026
 02:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
In-Reply-To: <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 15:59:55 +0700
X-Gm-Features: AUfX_myHjaHhMRuATtXSNJb3hMWPktXUxThFKw4KnDmx30oADvzEsWx9LpvQM5w
Message-ID: <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_020011_136387_75AF6E8A 
X-CRM114-Status: UNSURE (   9.16  )
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

Hi Guenter,

Thanks for the review.

>
> This is wrong. Check the if() path - the code ends up here if pretimeout == 0,
> even if irq > 0.
>

You're right. I misunderstood the condition in the if() path.
I'll rewrite it as follows:

 irq = platform_get_irq_optional(pdev, 0);
+if (irq < 0 && irq != -ENXIO)
+        return irq;
if (data->pretimeout && irq > 0) {
.....
 } else {
- if (irq == -EPROBE_DEFER)
-       return -EPROBE_DEFER;
  wdt->wdd.info = &qcom_wdt_info;
 }

Best regards,
Phuc

