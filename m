Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5A2C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx4TBzhJx8K0HvNhESnsvKGKLNHd0Z0vKd6OX1rMKEI=; b=bMGhf2HKBWGXvD4L0HdpTCTR0e
	r3O5QDIE+ym5JUfJTHbPcmgqOeAmR6PqO/4xOHKn3luUcP3kKPkr8BfOjCkztqocSKaIurmd4Hyag
	kw36+pyR3qyldVT8iky4L8bg480ao+IrNHEwDdu41fmmNMFO+rGESY0kUjTwekrwXjjop1JBMyl3z
	XjUkoMtaX3qUcYfqkh2HSgirkPC28BTFEQx9bLLaodMH2WHPyX+sum9W7RJ2oE042x50R6orJ5f85
	VaVP3Lx6KSnmoH7JaDFB8fR6ZxgaNK59L3Zc6i8X22r0pnMCqMwFmPpE7/koSzkQAXB7nW7MSh5HW
	SVJPm6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFSi-00000005EYV-0NaV;
	Thu, 07 Mar 2024 15:15:12 +0000
Received: from outgoing6.flk.host-h.net ([188.40.0.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riFSc-00000005EV3-0ijW;
	Thu, 07 Mar 2024 15:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=jx4TBzhJx8K0HvNhESnsvKGKLNHd0Z0vKd6OX1rMKEI=; b=sY7Rkw/FxJTKWN
	gxlO2Csb8PtIDcCN/Q4iDvDWTPplaYQ/MeYmkak63jFzRTztW8h4UnayTRwFxzAStzWlqAmeOtMDQ
	QufwsGhMfft87vkrlAxhYTmVzVjDJ6y6710JwmhDXg2/seWo5QuPhXa30t9SeeozSkmU5oFD9fWzi
	7mN5gCp1q3eBeQ2qAc7smlDlgQ/ktMNoW8LXcFSHk86PmPElKA93+tMWopEw7Fqvf6UGG8ftG5OVK
	PYfg3MbUC0+7PfP7iAmXAfq9V152J/mi310QUsJkIqQUCsGrTANFr8bpGAaqhYrz/IEWxQhVcw0kI
	eFYAPzV/wxewf97uUs8Q==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam2-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riFSU-001cWl-RA; Thu, 07 Mar 2024 17:15:02 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riFST-0002Zf-BT; Thu, 07 Mar 2024 17:14:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 07 Mar 2024 17:14:57 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] mips: dts: ralink: mt7621: add serial1 and serial2
 nodes
In-Reply-To: <CAMhs-H9WyQZsvEvCfUcZ0_eU8--EzxEmaxR50wdRFDGP3E64ZQ@mail.gmail.com>
References: <20240306201045.1475-1-justin.swartz@risingedge.co.za>
 <20240306201045.1475-2-justin.swartz@risingedge.co.za>
 <CAMhs-H9WyQZsvEvCfUcZ0_eU8--EzxEmaxR50wdRFDGP3E64ZQ@mail.gmail.com>
Message-ID: <13e3063facfea3407dba23b74b0a56db@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00421987309364)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+YJ0azQP9ouHAv4lOsgnc5PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNMwpa8J6LDEGB71xpBP9rMN3suOKfn8Hl
 koyhyj7ioi1H+3FR74FPtCVqefSOps3D+BsRiAfACpgn8kblwE1ZMwvRLhhMqf7a46YJlLKUNwTw
 bOl0qtP5EgfDRdSDhnwOLtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz30/jNv+A51L2swh0gYW0eVWShle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVK0T+c9pM0FteOLwuqFxkZtxbXpCgbiKBsA+Ddi6m
 awd1jemntr2PrMOTF1fDnHo5A9JQxMw0XtBqT5kbx7zuprmKeJENT1oiQUtfU17WEZPRHu1+r6ov
 Q/IKaojN7gdb+Glhdb8DP7Iz3Z0Qa+VGiF/lfNRtaK1t4SnssY938wKgOC3c9GkW+OmRHU05XGuW
 g+VcQ3bZb7F7k2CvWvw8dbdRONqsj33t0is+SdoOwskzjQ3HNBTON2jSSA8HXOMVb5qgpERsDkCX
 BgcGBwKlYailDNhe7w2QIanZ/NegoJ79AXUnIiEEoyCaZXMG8LAkbJoO2tY/Mg5ClXd30oBm8U++
 JlmpaolH3tK93iPfP98wGFbAohdBavKJPKk6p1wUrYGZdaoTwlx9fA78Kt3ezXLYM3A6BXfvel8O
 EFDbU51Q2S43vcWL3lM20b9wQESc+PquLiZOpxiedGbqX4nzL9MgCv99rrli2UQdOGeuQqV2IVXB
 o/3R5VqqcOmERbjE+D5FzT0EaduWMjGSdmMR5Ch1HY0a4RW7JP9zvdSGB9tIDxuFtg36jUhUk8/b
 P2/Mw1j9lmNQqiIAMR1SEszVdPY4ocfmWv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_071506_376081_6B0AC69F 
X-CRM114-Status: GOOD (  17.89  )
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

Hi Sergio

On 2024-03-07 12:04, Sergio Paracuellos wrote:
> Hi Justin,
> 
> On Wed, Mar 6, 2024 at 9:11 PM Justin Swartz
> <justin.swartz@risingedge.co.za> wrote:
>> 
>> Add serial1 and serial2 nodes to define the existence of
>> UART1 and UART2.
>> 
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>> ---
>>  arch/mips/boot/dts/ralink/mt7621.dtsi | 38 
>> +++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>> 
>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi 
>> b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> index dca415fdd..2069249c8 100644
>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> @@ -128,6 +128,44 @@ serial0: serial@c00 {
>>                         pinctrl-0 = <&uart1_pins>;
>>                 };
>> 
>> +               serial1: serial@d00 {
>> +                       status = "disabled";
>> +
>> +                       compatible = "ns16550a";
>> +                       reg = <0xd00 0x100>;
>> +
>> +                       clocks = <&sysc MT7621_CLK_UART2>;
>> +
>> +                       interrupt-parent = <&gic>;
>> +                       interrupts = <GIC_SHARED 27 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                       reg-shift = <2>;
>> +                       reg-io-width = <4>;
>> +                       no-loopback-test;
>> +
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&uart2_pins>;
>> +               };
>> +
>> +               serial2: serial@e00 {
>> +                       status = "disabled";
>> +
>> +                       compatible = "ns16550a";
>> +                       reg = <0xe00 0x100>;
>> +
>> +                       clocks = <&sysc MT7621_CLK_UART3>;
>> +
>> +                       interrupt-parent = <&gic>;
>> +                       interrupts = <GIC_SHARED 28 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                       reg-shift = <2>;
>> +                       reg-io-width = <4>;
>> +                       no-loopback-test;
>> +
>> +                       pinctrl-names = "default";
>> +                       pinctrl-0 = <&uart3_pins>;
>> +               };
>> +
> 
> Please follow the preferred order for properties described in dts
> coding style [0]. I know that there is some mess around the properties
> order in some nodes with the current dtsi file but we did not have
> coding style before and now we have it, so I think we should follow it
> at least for new additions.

No problem. I see you've already "Acked-by" patch 1 (adding pinctrl
properties to serial0) of this set, so would it be a better move to
submit a new patch set that would look something like:

  1. add pinctrl-name and pinctrl-0 to serial0 [no changes from what I 
sent]
  2. reorder serial0 properties according to the DTS style guidelines
  3. add serial1 and serial2 with the correct property order

Or instead, submit one more patch that will reorder the properties in
serial0, serial1 and serial2 - which would depend on the current set?


> Best regards,
>     Sergio Paracuellos

Regards
Justin


> [0]: https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

