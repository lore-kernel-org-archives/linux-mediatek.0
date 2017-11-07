From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL v2] Mediatek: 32-bit DTS updates for v4.15
Date: Tue, 7 Nov 2017 16:11:52 +0100
Message-ID: <CAK8P3a1jP+pWsm06+jNJwQsVDRBx+9zNuxD4Rb8obcFCTPxqhQ@mail.gmail.com>
References: <8a52a27e-f930-e873-6803-233dfa48b087@gmail.com>
 <6fcfb359-6486-3051-1d6a-1eb18e6f0bc4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6fcfb359-6486-3051-1d6a-1eb18e6f0bc4@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Weiqing Kong <weiqing.kong@mediatek.com>, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Nov 7, 2017 at 3:14 PM, Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 11/02/2017 07:52 PM, Matthias Brugger wrote:
>> are available in the git repository at:
>>
>>   https://github.com/mbgg/linux-mediatek.git tags/v4.14-next-dts32-2
>>
>> for you to fetch changes up to eb54a522f164f89587381d665307d53acf75f114:
>>
>>   arm: dts: mt7623: remove unused compatible string for pio node (2017-11-02
>> 19:43:20 +0100)
>>
>> ----------------------------------------------------------------
>> - mt7623 update nodes to binding description
>> - mt2701 add display pwn nodes
>> - mt2701 update audio node description
>>
>> ----------------------------------------------------------------
>> Ryder Lee (4):
>>       arm: dts: mediatek: update audio node for mt2701 and mt7623
>>       arm: dts: mt7623: update crypto node
>>       arm: dts: mt7623: update usb related nodes
>>       arm: dts: mt7623: remove unused compatible string for pio node
>>
>> Weiqing Kong (2):
>>       arm: dts: mt2701: add pwm backlight device node
>>       arm: dts: mt2701: enable display pwm backlight
>>
>>  arch/arm/boot/dts/mt2701-evb.dts | 23 +++++++++++++++++++++++
>>  arch/arm/boot/dts/mt2701.dtsi    | 13 ++++++++++++-
>>  arch/arm/boot/dts/mt7623.dtsi    | 30 +++++++++++++++++-------------
>>  3 files changed, 52 insertions(+), 14 deletions(-)
>>
>
> I don't see this commits in your repository. Did you forgot to merge them?
>

It was still on my todo list, but I should not have waited that long. Thanks
for the reminder.

Pulled into next/dt now.

      Arnd
