Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8149DC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 12:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKP3sYFjtsj0cchtdDG+ZU4/Ri6nxNJaSUgMG/EUeFU=; b=nqqEzVr0w8BshskuW/FWAFmEFe
	xY+xhdZMs1HWSpgI5S3oFAMSW1u+4CFlfvqIPdE1SOi+NDdXRRl+1qDa4LfmmQnZ+V8f+ahBfs+jU
	CSgvf52wFgbO5WMaFZltLEaHi6uTwhKrAUiWad8oYP63Zk/9z0idXhFub4yygX7w6Mj4S1xX8lsp5
	xLDYQg9nUCj3fwJM8gOf+OI+UWJW9ZPEDyYXDfKuqfto5WfDRW0Ze5axeHhDuhr8eHyDFp6hbjduQ
	UOOkVtN7nlNTHXFMYvqsRSNsOHvt5HdWk1fLKw9O/weh/KGGrF/vrnax9rjQThbnmJvs9l8VSdl8U
	HpPHCbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riZWm-000000099zl-0Nfd;
	Fri, 08 Mar 2024 12:40:44 +0000
Received: from outgoing6.flk.host-h.net ([188.40.0.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riZWg-000000099xo-46xU;
	Fri, 08 Mar 2024 12:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=SKP3sYFjtsj0cchtdDG+ZU4/Ri6nxNJaSUgMG/EUeFU=; b=VmyQXsTlLQTaAx
	e8fU3utV0jh2K1CsoGJxwnMP02Fes54lqeMWKw9OufWGIgaJD54qUqYuQG9WmmNwHEtoXNrn5s1Oh
	MncmigTGov+74vNSIMhr0/1yliP+83ePLwCCGL7EYSWF8KA3bBhgzP2I81o5QCLANqSJVt+3KBood
	sla6n2IoJmrSA/PnvlBQZlExH6zmoz7N27iIiVF1Qfjm+M16FtqIHNIQxtutOfxp37ixb4IC9fjOS
	KxYC9yxYZ9SblNAr3nSiph7PgjDBh1hHtcrXzMlEVOSmeYE2VQMylshkHdRipcSkKZ5LQQdyHEClt
	RxnTrfgdkD0Ily+/xybQ==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam2-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riZWZ-00CVPf-1L; Fri, 08 Mar 2024 14:40:33 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1riZWX-0004Zw-Rx; Fri, 08 Mar 2024 14:40:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 08 Mar 2024 14:40:29 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Sergio
 Paracuellos <sergio.paracuellos@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
In-Reply-To: <ff708cd5-efe1-47e0-8112-ac7a2658cd8d@collabora.com>
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <ff708cd5-efe1-47e0-8112-ac7a2658cd8d@collabora.com>
Message-ID: <9634b4fe726e711bd6bec7e487caab76@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00380610437891)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+wmtT960jbjISQKCfCHZdhPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVPit/5p/UppEg0/JwKBg5FMRzYBX9pjfk8XVXtzS
 M3wtVd1VnG8mylYLnooMTA9ChvO6VFs0vX2gELKmaDCsAzWS05LVvQliOjpXTRsE1NclUiAnTpgi
 e3//sbVPjjckBwdlwGs8P76dIjazMPdHjbVa8IFhvS8ktfBv/FnVAz3RioBldMOCUe6W32a/Z3Ud
 cHFsZn+h8ah6heNAolF39ruEJL+xj3lCq/QHicKvqr722vaUI4f+CqAdyuhpbsPsA5dFhrqMzPRa
 pehQIEhjhQfGlRm8CMroDEc+PSVSriE1+zEmCoWmtSSzl75hPZky5CJ+Z16HH97574/r8Tz/vibx
 cwM0aDExi5MlveCS7R16LtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz30/jNv+A51L2swh0gYW0eVWShle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVK0T+c9pM0FteOLwuqFxkZtxbXpCgbiKBsA+Ddi6m
 awd1jemntr2PrMOTF1fDnHo5A9JQxMw0XtBqT5kbx7zuprmKeJENT1oiQUtfU17WEZPRHu1+r6ov
 Q/IKaojN7gdb+Glhdb8DP7Iz3Z0Qa+VGiF/lfNRtaK1t4SnssY938wKgOC3c9GkW+OmRHU05XGuW
 g+VcQ3bZb7F7k2CvWvw8dbdRONqsj33t0is+SdoOwsmMdG9QVrFQ8yBgkEseVcqyb5qgpERsDkCX
 BgcGBwKlYailDNhe7w2QIanZ/NegoJ79AXUnIiEEoyCaZXMG8LAkbJoO2tY/Mg5ClXd30oBm8U++
 JlmpaolH3tK93iPfP99cvlYnvoiVFqgm093JBbUEaDQ0rf5lRqYaI2rFfhfWZ3LYM3A6BXfvel8O
 EFDbU51Q2S43vcWL3lM20b9wQESc+PquLiZOpxiedGbqX4nzL9MgCv99rrli2UQdOGeuQqV2IVXB
 o/3R5VqqcOmERbjE+D5FzT0EaduWMjGSdmMR5Ch1HY0a4RW7JP9zvdSGB9tIDxuFtg36jUhUk8/b
 P2/Mw1j9lmNQqiIAMR1SEszVdPY4ocfmWv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_044039_659174_0C224D99 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Angelo

On 2024-03-08 10:41, AngeloGioacchino Del Regno wrote:
> Il 07/03/24 20:04, Justin Swartz ha scritto:
>> Add missing pinctrl-name and pinctrl-0 properties to declare
>> that the uart1_pins group is associated with serial0.
>> 
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>> ---
>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>> 
>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi 
>> b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> index 35a10258f..dca415fdd 100644
>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> @@ -123,6 +123,9 @@ serial0: serial@c00 {
>>   			reg-shift = <2>;
>>   			reg-io-width = <4>;
>>   			no-loopback-test;
>> +
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&uart1_pins>;
>>   		};
>>     		spi0: spi@b00 {
> 
> The pins are muxed and can be either UART, or some other function that
> is supported by the mux: this means that the pinctrl-xxx properties 
> shall
> *not* go into the SoC dtsi file, but in board dts files instead.
> 
> Said differently: the usage of the UART pins is board-specific, not 
> SoC-wide.

Thanks for the explanation. I agree that the pinctrl properties
would make more sense in a serial node extension in a board's dts,
but my reason for including them in the SoC's dtsi is due to the
precedent set with these existing nodes:

   i2c
   spi0
   mmc
   ethernet
   pcie

There is also a default function declared for each of the pin
groups defined under the pinctrl node. These functions co-incide
with what is intended for each of those device nodes to function
correctly, rather than in the alternative GPIO-mode.

So I thought that sticking with that existing pattern would get
the least resistance from the community.

I can imagine how moving the pinctrl node to the board dts, and
then moving all of the pinctrl properties associated with device
nodes to their board dts references could be a better separation
logically.

What do you recommend?

Regards
Justin

